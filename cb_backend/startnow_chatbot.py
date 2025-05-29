from fastapi import FastAPI
from pydantic import BaseModel
from groq import Groq
import os
import re
from dotenv import load_dotenv

load_dotenv()

app = FastAPI()
client = Groq(api_key=os.environ.get("GROQ_API_KEY"))

@app.get("/ping")
async def ping():
    return {"message": "pong"}

class Message(BaseModel):
    userInput: str

knowledge_base = {
    #intent: Greeting
    ("hi", "hello", "hey", "sup", "ayo"): "Hello! How can I assist you today?",

    #intent: Farewell/Thanks
    ("bye", "thanks", "thank you"): "You’re welcome!  Feel free to message again for any inquiries.",

    #intent: Enrollment period
    ("enrollment date", "enrollment period", "when is the enrollment"): "Enrollment is open from May 1st and ends on July 31st. For irregular students: June 1st to July 31st.",

    #intent: Enrollment Requirement
    ("what are the requirements", "what do I need for enrollment", "requirements"): (
        "If you are a College Freshman:\n"
        "- Original Form 138 / SF9-SHS\n"
        "- Original Form 137 / SF10-SHS\n"
        "- PSA-issued Birth Certificate\n"
        "- Original Copy of Certificate of Good Moral Character or Recommendation from the Dean/Program or Department Head\n"
        "- Medical Certificate of Chest X-ray results\n"

        "For College Trasferees:\n"
        "- Certificate of Transfer or Honorable Dismissal\n"
        "- Official Transcript of Records\n"
        "- PSA-issued Birth Certificate\n"
        "- Original Copy of Certificate of Good Moral Character or Recommendation from the Dean/Program or Department Head\n"
        "- Medical Certificate of Chest X-ray results"
    ),

    #intent: Requirement Submission
    ("where can i submit my requirements", "where to submit my documents", "submission of requirements"): "All document requirements are to be submitted personally at the school’s admission desk or registrar office.",

    #intent: Enrollment Process
    ("how do i enroll", "how to resgister my enrollment", "how does enrollment work", "enrollment process", "enrollment"): (
        "Enrollment is open from May 1st and ends on July 31st.\n"
        "Here are the steps to proceed with the enrollment using our application:\n"
        "- Go to the Main Dashboard and click on the ‘Enroll Now’ button.\n"
        "- For new students, enter your desired course.\n"
        "- For existing students, enter your student number and access code.\n"
        "- Settle the reservation fee before proceeding.\n"
        "- Fill-in the necessary personal information in the form.\n"
        "- Lastly, validate the information you entered before finalizing your enrollment and proceed to the cashier to settle your payment."
    ),

    #intent: Irregular Student Enrollment Process
    ("how does the enrollment process for irregular students work", "irregular student enrollment", "irregular enrollment"): (
        "For irregular students, enrollment period starts on June 1st until July 31st.\n"
        "Here are the steps to proceed with the enrollment using our application:\n"
        "- Go to the Main Dashboard and click on the ‘Enroll Now’ button.\n"
        "- Make sure to have your approved subject checklist beforehand.\n"
        "- Settle the reservation fee before proceeding.\n"
        "- Fill-in the necessary personal information in the form.\n"
        "- Select your subjects based on the approved checklist.\n"
        "- Lastly, validate the information you entered before finalizing your enrollment and proceed to the cashier to settle your payment."
    ),

    #intent: Entrance/Application Process
    ("is there an entrance exam", "application process"): "The school does not require any entrance examinations. All applicants may proceed directly with the registration and submit their requirements accordingly.",

    #intent: Enrollment Status
    ("did my enrollment go through", "status of my enrollment", "enrollment status", "is my application approved"): "You will receive a confirmation in the app once your enrollment and requirements are successfully processed. You may also view the status in your account page.",

    #intent: Cancel Enrollment
    ("how can i cancel my enrollment", "cancel enrollment", "withdraw application"): "Cancellation or withdrawal of enrollment requires an exit clearance from the registrar.",

    #intent: Available Courses
    ("available courses", "what courses are available", "list of courses", "courses"):  (
        "The available courses in STI Caloocan are:\n"
        "- BS Computer Science(BSCS)\n"
        "- BS Information Technology(BSIT)\n"
        "- BS Computer Engineering(BSCpE)\n"
        "- BS Accountancy(BSA)\n"
        "- BS Business Administration(BSBA)\n"
        "- BS Accountancy Information System(BSAIS)\n"
        "- BS Hospitality Management(BSHM)\n"
        "- BS Tourism Management(BSTM)\n"
        "- BA Communication(BACOMM)\n"
        "- Bachelor of Multimedia Arts(BMMA)"
    ),

    #intent: Add/Drop Subjects
    ("drop subject", "dropping of subjects", "add or drop a subject after enrollment"): "You may add or drop subjects through our app only during a specific adjustment period from September August 30th – September 10th.",

    #intent: Class Schedule
    ("when do classes start", "class schedule", "first day of class", "start of school", "class starts"): "Classes officially starts on September 1. Your class schedule is visible on your account page after your enrollment is successful.",

    #intent: Section Picking
    ("can i pick my own section", "can i choose my own section"): "You may pick your section based on the available schedules offered.",

    #intent: Grade Viewing
    ("where to view my grades", "view my grades", "how can i check my grades online", "grades"): "You may view your grades through the OneSTI portal.",

    #intent: Tuition Fee
    ("how much is the tuition", "tuition fee", "tuition"): "Tuition fee vary by course or the number of units taken. You may visit the 'Tuition Fee Advising Page' for an estimate.",

    #intent: Remaining Balance
    ("remaining balance", "standing balance", "balance"): "You may view any remaining balance through the OneSTI portal or requirest a statement of account at the Cashier’s Office.",

    #intent: Deadlines
    ("deadline of requirements", "when is the deadline of document submission?"): "Students are given ample time to gather their documents, but it’s strongly encouraged to submit them early to avoid enrollment issues in future semesters.",

    #intent: Payment Methods
    ("how to pay tuition fee", "where can i pay", "Does the school accept online payments", "payment process"): "All payments must be made in person at the Cashier’s Office. Online payments methods such as Gcash are available.",

    #intent: Scholarship and Discounts
    ("available scholarships", "available discounts", "scholarship", "scholarships", "discount"): "The school offers various financial assistant programs such as subsidy and voucher, government educational assistance, and open scholarships.", 

    #intent: Scholarship and Discounts Details
    ("how to apply for financial assistance", "where to submit my scholarship requirements", "application for scholarship"): "You may apply for STI’s scholarship, voucher, and financial assistance programs by coordinating directly with the campus. Application forms and requirements are provided onsite.",

    #intent: System/App Details
    ("how does the app work", "features of the application"): "STI StartNow provides information about schedules, requirements, deadlines, and FAQs, as well as a convenient enrollment application without the need for any desktop devices. All official transactions are processed at the campus.",

    #easter eggs
    ("mija", "mateo"): "Where have you buried your best days? Have you lived or not? Look, one says to oneself, look how cold the world is growing. - Fyodor Dostoyevsky, White Nights.",
    ("julius", "patio"): "Lead Programmer. Goated since birth.",
    ("aurick", "lorenzo"): "Lead UI designer. Goat from the heavens.",
    ("paul", "pol", "caligagan", "caligenggeng"): "Documentationist. Repo master.",
    ("gwen", "wyona"): "Ehh",
    ("serr", "serr lorenz"): "Thesis Advisor. Our goat. We labyu serr.",
    ("carnites", "pogi"): "Mr. STI",
}

def cleanInput(text):
    return re.findall(r'\b\w+\b', text.lower())

@app.post("/chat")
async def chat(msg: Message):
    user_msg = msg.userInput.lower()
    words = cleanInput(user_msg)

    for keywords, response in knowledge_base.items():
        if any(keyword in user_msg for keyword in keywords) or any(keyword in words for keyword in keywords):
            return {"response": response}

    try:
        chatCompletion = client.chat.completions.create(
            messages = [
                {"role": "system",
                "content": (
                    "You are a friendly, helpful, and fun Start Now assistant. "
                    "If you don't know the answer to a question, reply with: "
                    "'I'm sorry, I couldn’t find that in our records. Please try rephrasing or ask about something else.'")
                },
                {"role": "user", "content": msg.userInput}
                ],
            model = "llama3-70b-8192"
        )
        respo = chatCompletion.choices[0].message.content
        return {"response": respo}
    except Exception as e:
        return {"error": str(e)}
