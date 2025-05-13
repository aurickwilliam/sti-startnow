import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/enrollment_dashboard/components/course_tile.dart';
import 'package:sti_startnow/pages/enrollment_dashboard/course_offer_info_page.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class CourseOfferListPage extends StatelessWidget {
  CourseOfferListPage({super.key});

  final List<List> informationTechnologyCourses = [
    [
      "Bachelor of Science in Computer Science", 
      "assets/img/enrollment_dashboard/courses_img/technology.jpg",
      "Master in-demand programming languages and write the code for smart tech solutions. Our BS Computer Science program places you at the forefront of the most sought-after industry today with in-depth knowledge and technical skills in machine learning, artificial intelligence, data science and analytics, cloud computing, and more. \n\nTrain in fully-equipped computer laboratories, be exposed to hackathons and coding competitions, and join various activities that will also provide and sharpen your skillsets in problem solving, critical thinking, and business presentation skills that are essential for a long career in the fast-paced IT industry.",
      [
        "Machine Learning",
        "Artificial Intelligence",
        "Data Science and Analytics",
        "Cloud Computing",
        "Programming Languages",
        "Software Development",
        "Computing Algorithms",
      ],
      [
        "Application Developer"
        ".NET Developer",
        "Business Analyst",
        "Cloud Architect",
        "Data Analyst",
        "Data Scientist",
        "Front-End Developer",
        "Full Stack Developer",
        "Mobile Application Developer",
        "Software Developer",
        "Software Engineer",
        "Software Quality Assurance Specialist",
        "Software Tester",
        "Systems Analyst",
        "Web Developer",
      ]
    ],

    [
      "Bachelor of Science in Information Technology", 
      "assets/img/enrollment_dashboard/courses_img/it.jpg",
      "Designed to provide a broad understanding of information and communication technology, our BSIT program delivers an innovative education that equips students with practical knowledge and real-life skills to adapt in a rapidly evolving ICT-driven world.\n\nGrasp various technical expertise from cloud computing, mobile & web development, cybersecurity, user experience design to information management, and get industry-standard certifications from our global partners including Huawei, Microsoft, and Oracle to name a few.",
      [
        "Cloud Computing",
        "Data Science and Analytics",
        "Cybersecurity",
        "Mobile and Web Development",
        "Software Development",
        "User Experience (UX) Design",
        "Information Management",
      ],
      [
        "Application Developer",
        "Client Support Specialist",
        "Cloud Architect",
        "Cybersecurity Specialist",
        "Information Security Analyst",
        "Network Engineer",
        "IT Project Manager",
        "Software Developer",
        "Software Quality Assurance Specialist",
        "Systems Administrator",
        "Systems Analyst",
        "System Support Specialist",
        "User Experience (UX) Designer",
        "Web Developer",
      ]
    ],
  ];

  final List<List> engineeringCourses = [
    [
      "Bachelor of Science in Computer Engineering", 
      "assets/img/enrollment_dashboard/courses_img/math.jpg",
      "Committed to cultivate aspiring tech developers of the future, our BSCpE program immerses students in computer-based system studies and solutions, with the help of our state-of-the-art equipment and laboratories, that will aid them in their quest of innovating the next generation of technology.\n\nEquip yourself with core aptitudes such as developing modern computer systems, analyzing data communications, deciphering computer systems architecture, and mastering software development that are essential for the budding global technological revolution.",
      [
        "Digital Design",
        "Digital Signal Processing",
        "Computer Architecture and Organization",
        "Embedded Systems",
        "Data and Digital Communications",
        "Internet of Things (IoT)",
        "Circuits and Electronics",
      ],
      [
        "Cloud Engineer",
        "Computer Network Architect",
        "Data Communications Engineer",
        "Embedded Systems Engineer",
        "Firmware Engineer",
        "IoT Developer",
        "Network Administrator",
        "Network Operations Center (NOC) Engineer",
        "Robotics Process Automation (RPA) Developer",
        "Software Security Engineer",
        "Systems Administrator",
        "Quality Assurance Engineer",
        "Technical Engineer",
        "Telecommunications Engineer",
        "Test Engineer",
      ],
    ],
  ];

  final List<List> businessManagementCourses = [
    [
      "Bachelor of Science in Business Administration", 
      "assets/img/enrollment_dashboard/courses_img/literature.jpg",
      "Committed to instill an extensive understanding in the business field, our BSBA program provides quality entrepreneurship education, along with its comprehensive curriculum, that develops business-driven character among students that will allow them to thrive in the ever-changing industry.\n\nLearn all about the principles and conventions associated with the adaptive style of managing a business from basic finance and economics, marketing, and customer service, among other courses that are essential in running an effective business.",
      [
        "Business Management",
        "Marketing, Sales, and Customer Service",
        "Operations Management",
        "Entrepreneurial Management",
        "Financial Management",
        "Facilities Management",
        "Inventory Management",
      ],
      [
        "Marketing Associate/Manager",
        "General and Operations Manager",
        "Logistics/facilities Manager",
        "Business Developer/Entrepreneur",
        "Warehouse Manager",
        "Inventory Manager",
        "Financial Manager",
        "Loan Officer",
        "Procurement Officer",
        "Office Administrator",
        "Account Manager",
        "Sales Representative",
        "Business Analyst",
        "Production Manager",
        "Business Researcher",
        "Trader",
      ],
    ],
    [
      "Bachelor of Science in Accountancy", 
      "assets/img/enrollment_dashboard/courses_img/math.jpg",
      "Designed to equip future accountants with in-depth understanding of accounting fundamentals and practices, our BSA program delivers a multidisciplinary approach that will help our students forge a successful career in the business world.\n\nGain advanced theoretical and practical knowledge on financial accounting and reporting, cost accounting and management, accountancy and control, taxation, and accounting information systems that will help you enhance your decision-making and critical analysis skills necessary to develop effective business strategies. Furthermore, you will be qualified to take the board exams after you graduate and become a Certified Public Accountant.",
      [
        "Tax Preparation",
        "Auditing",
        "Cost Accounting",
        "Financial Accounting and Reporting",
        "Accounting Information System",
        "Accounting for Government and Non-profit Organizations",
        "Accounting for Business Combinations/Special Transactions",
        "Intermediate Accounting",
      ],
      [
        "CPA",
        "Tax Accountant/Consultant",
        "Financial Analyst/Manager",
        "Government Accountant",
        "Audit Examiner",
        "Budget Officer",
        "Revenue Officer",
        "Financial Manager",
        "Internal Auditor",
        "Credit Analyst",
        "Accounting Clerk",
        "Financial Services Specialist",
        "Cost Accountant",
        "Investment Analyst",
        "Treasury Analyst",
      ]
    ],
    [
      "Bachelor of Science in Accountancy Information System", 
      "assets/img/enrollment_dashboard/courses_img/technology.jpg",
      "As businesses start to rely more on technology, our BSAIS program equips the students with cutting edge skills in accounting and management information systems needed for the evolving business environment.\n\nGrasp a deeper understanding on key accounting systems and processes paired with industry-specific financial software, networks, and security that will help you develop specialized careers in accounting, auditing, business analysis, and management.",
      [
        "Tax Preparation",
        "Cost Accounting",
        "Financial Accounting and Reporting",
        "Accounting Information System/ Management Information System",
        "Intermediate Accounting",
        "Database Management",
        "Enterprise Resource Planning Management",
        "Information Systems Operations, Maintenance, and Security",
      ],
      [
        "Tax Accountant/Consultant",
        "Financial Analyst/Manager",
        "Government Accountant",
        "Budget Officer",
        "Revenue Officer",
        "Financial Manager",
        "Internal Auditor",
        "Credit Analyst",
        "Accounting Clerk",
        "Financial Services Specialist",
        "Cost Accountant",
        "Management Information System Analyst",
        "IT Internal Auditor",
        "Accounting Information System Analyst",
        "Data Analytics Manager",
      ]
    ],
  ];

  final List<List> hospitalityManagementCourses = [
    [
      "Bachelor of Science in Hospitality Management", 
      "assets/img/enrollment_dashboard/courses_img/cooking.jpg",
      "Gain the knowledge and skills to welcome various guests and create memorable experiences in our BSHM program with a curriculum that's made to meet the global demands and requirements of the hotels, restaurant, and bars.\n\nGet hands-on training in industry-standard facilities and laboratories from industry professionals who will impart their experience and expertise in guest relations, hospitality marketing, new working safety and security, and hospitality technology, among many to develop globally competitive hospitality professionals.",
      [
        "Guest Relations",
        "Hotel/Resort Operations and Management",
        "Restaurant and Bar Operations and Management",
        "Supply Chain Management",
        "Hospitality Marketing",
        "Events Management",
        "Entrepreneurship",
        "Hospitality Technology",
      ],
      [
        "Hotel General Manager",
        "Hotel Resident Manager",
        "Resort Manager",
        "Restaurant Manager",
        "Bar Manager",
        "Executive Chef",
        "Sous Chef",
        "Pastry Chef",
        "Sales and Marketing Executive",
        "Food and Beverage Manager",
        "Front Office Manager",
        "Housekeeping Director",
        "Catering and Banquet Director/Manager",
        "Events Supervisor/Manager",
        "Recreation Director/Leisure Manager",
        "Guest Relations Executive",
        "Cruise Directors",
        "Shore Excursion Manager",
        "Conventions Manager",
        "Public Relations Manager",
        "Casino Host",
        "Recreations/Spa Manager",
        "Theme Park Manager",
        "Human Resources Manager",
        "Cruise Ship Manager",
        "Lodging Manager",
      ]
    ],
  ];

  final List<List> tourismManagementCourses = [
    [
      "Bachelor of Science in Tourism Mangement", 
      "assets/img/enrollment_dashboard/courses_img/tourism.jpg",
      "Get a head start for a career in the tourism and travel industry with our BSTM program. Aimed for developing globally competitive professionals with the skills to take on work opportunities in hotels, tour and travel agencies, airlines, and cruise lines, among many here and abroad.\n\nTrain hands-on in simulation laboratories and arm yourself with the essential knowledge and skills in multicultural communication, events planning, airline management and operations, tour and travel management, and more.",
      [
        "Customer Service",
        "Communication",
        "Business Acumen and Commercial Awareness",
        "Events Planning",
        "Tour and Travel Management and Operations",
        "Tourism Sales and Marketing",
        "Airline Management and Operations",
      ],
      [
        "Flight Attendant",
        "Events Manager",
        "Tour Operator",
        "Tourism Marketing Manager",
        "Travel Agency Manager",
        "Tourism Information Center Manager",
        "Guest Relations Manager",
        "Airlines Operations Supervisor/Manager",
        "Airline Reservations Supervisor/Manager",
        "Airline Customer Service Supervisor/Manager",
        "Sales and Marketing Supervisor/Manager",
        "Recreations Director",
        "Destination Manager",
        "Ticketing Supervisor/Manager",
        "Tourism Operations Officer",
        "Travel Specialist/Consultant",
      ]
    ],
  ];

  final List<List> artSciencesCourses = [
    [
      "Bachelor of Arts in Communication", 
      "assets/img/enrollment_dashboard/courses_img/communication.jpg",
      "From broadcasting to journalism, public relations to advertising and more, our BA Communication program trains future communication professionals with marketable skills and in-demand competencies for a wide variety of industries.\n\nDevelop writing, speaking, presentation, research, and effective communication skills in traditional and digital media, experience what goes in a television, radio, and film production shoot, gain exposure to various workshops, activities, and internship opportunities with industry partners ABS-CBN and more.",
      [
        "Research and Analysis Information",
        "Interpersonal Communication",
        "Visual Design",
        "Public Speaking",
        "Media Relations",
        "Digital Photography",
        "Broadcasting Principles and Practices",
        "Journalism Principles and Practices",
        "Communication Theory",
        "Development Communication",
        "Brand Communication and Design",
        "Social Media Principles and Practices",
        "Advertising Principles and Practices",
        "Communication Research",
        "News Writing",
        "Screen Writing",
        "Web Content Management",
        "Communication Management",
      ],
      [
        "News Correspondent/Reporter",
        "Sports News Announcer",
        "Journalist",
        "Social Media Manager",
        "Brand Strategist/Manager",
        "Copywriter / Copy Editor",
        "Segment Director/Producer/Writer",
        "Advertising Account Executive",
        "Documentary/Film Maker",
        "Public Relations Officer",
        "Communication/Information Officer",
        "Communication Researcher/Analyst",
        "Media Planner",
        "Content Strategist",
        "Video/Film Editor",
        "Audio/Visual Technician",
        "Digital Media Manager",
        "Web Content Writer",
        "Photojournalist",
        "Data Communications Analyst",
        "Media Consultant",
        "Event Planner",
        "Business Reporter",
        "Marketing Coordinator",
        "Communication Specialist",
        "Proofreader",
        "Multimedia designer",
      ]
    ],
    [
      "Bachelor of Multimedia Arts", 
      "assets/img/enrollment_dashboard/courses_img/multimedia.jpg",
      "Great design inspires and can be impactful in conveying a message. Learn the visual communication theories, practices, principles, and techniques to build a strong portfolio as a creative professional in our BMMA program.\n\nHone your artistry using industry leading tools like Figma, Autodesk Maya, and more in learning animation, illustration, 3D modelling, web design, sound design, photography, and videography.",
      [
        "Video/Film Editing",
        "Video Production",
        "3D Animation",
        "Program and App Development",
        "Mobile and Device Development",
        "Digital Photography",
        "Design Concepts",
        "Web Content",
        "Instructional Design",
        "Art Direction",
        "Typography and Layout",
        "Sound Engineering",
      ],
      [
        "3D Animator/Artist",
        "Gameplay Animator/Designer",
        "Game Programmer",
        "Motion Graphics Animator/Designer",
        "Cartoonist",
        "Graphic Artist",
        "Web Designer",
        "Creative Director",
        "Art Director",
        "Media Director",
        "User Experience Designer",
        "Marketing/Advertising Manager",
        "Product Development Manager",
        "Media Strategist",
        "Digital Camera Operator",
        "Sound Engineer",
        "Multimedia Artist/Producer",
        "Film/Video Editor",
        "Installation Artist",
        "Photographer/Videographer",
        "Special Effects Artist",
        "VFX Artist",
        "Level Designer",
        "Digital Marketing Manager",
        "Web Developer",
        "Digital Imaging Specialist",
        "Interactive Designer",
      ]
    ],
  ];

  final List<String> coverImgCourse = [
    // Information technology
    "assets/img/enrollment_dashboard/courses_img/specific/information_technology.jpg",
    // Engineering
    "assets/img/enrollment_dashboard/courses_img/specific/engineering.jpg",
    // Business & Management
    "assets/img/enrollment_dashboard/courses_img/specific/business_management.jpg",
    // Hospitality Management
    "assets/img/enrollment_dashboard/courses_img/specific/hospitality_management.jpg",
    // Tourism Management
    "assets/img/enrollment_dashboard/courses_img/specific/tourism_management.jpg",
    // Art & Sciences
    "assets/img/enrollment_dashboard/courses_img/specific/art_sciences.png",
  ];

  @override
  Widget build(BuildContext context) {

    // if is in landscape
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              PageAppBar(
                title: "Course Offer", 
                onPressed: () {
                  Navigator.pop(context);
                }
              ),
                    
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isLandscape ? 200 : 24,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10,),
                          
                    Text(
                      "Information Technology",
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.primary,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    
                    Column(
                      children: informationTechnologyCourses.map((course) {
                        return CourseTile(
                          courseName: course[0], 
                          imgPath: course[1], 
                          onTap: () {
                            Navigator.push(context, 
                            MaterialPageRoute(builder: (context) => 
                            CourseOfferInfoPage(
                              courseName: course[0],
                              imgPath: coverImgCourse[0],
                              courseDescription: course[2],
                              skillToLearn: course[3],
                              careerOppotunities: course[4],
                            )));
                          }
                        );
                      }).toList(),
                    ),
                              
                    const SizedBox(height: 10,),
                          
                    Text(
                      "Engineering",
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.primary,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    
                    Column(
                      children: engineeringCourses.map((course) {
                        return CourseTile(
                          courseName: course[0], 
                          imgPath: course[1], 
                          onTap: () {
                            Navigator.push(context, 
                            MaterialPageRoute(builder: (context) => 
                            CourseOfferInfoPage(
                              courseName: course[0],
                              imgPath: coverImgCourse[1],
                              courseDescription: course[2],
                               skillToLearn: course[3],
                              careerOppotunities: course[4],
                            )));
                          }
                        );
                      }).toList(),
                    ),
                              
                    const SizedBox(height: 10,),
                          
                    Text(
                      "Business & Mangement",
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.primary,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    
                    Column(
                      children: businessManagementCourses.map((course) {
                        return CourseTile(
                          courseName: course[0], 
                          imgPath: course[1], 
                          onTap: () {
                            Navigator.push(context, 
                            MaterialPageRoute(builder: (context) => 
                            CourseOfferInfoPage(
                              courseName: course[0],
                              imgPath: coverImgCourse[2],
                              courseDescription: course[2],
                               skillToLearn: course[3],
                              careerOppotunities: course[4],
                            )));
                          }
                        );
                      }).toList(),
                    ),
                              
                    const SizedBox(height: 10,),
                          
                    Text(
                      "Hospitality Management",
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.primary,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    
                    Column(
                      children: hospitalityManagementCourses.map((course) {
                        return CourseTile(
                          courseName: course[0], 
                          imgPath: course[1], 
                          onTap: () {
                            Navigator.push(context, 
                            MaterialPageRoute(builder: (context) => 
                            CourseOfferInfoPage(
                              courseName: course[0],
                              imgPath: coverImgCourse[3],
                              courseDescription: course[2],
                               skillToLearn: course[3],
                              careerOppotunities: course[4],
                            )));
                          }
                        );
                      }).toList(),
                    ),
                              
                    const SizedBox(height: 10,),
                          
                    Text(
                      "Tourism Management",
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.primary,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    
                    Column(
                      children: tourismManagementCourses.map((course) {
                        return CourseTile(
                          courseName: course[0], 
                          imgPath: course[1], 
                          onTap: () {
                            Navigator.push(context, 
                            MaterialPageRoute(builder: (context) => 
                            CourseOfferInfoPage(
                              courseName: course[0],
                              imgPath: coverImgCourse[4],
                              courseDescription: course[2],
                               skillToLearn: course[3],
                              careerOppotunities: course[4],
                            )));
                          }
                        );
                      }).toList(),
                    ),
                              
                    const SizedBox(height: 10,),
                          
                    Text(
                      "Art & Sciences",
                      style: GoogleFonts.roboto(
                        color: AppTheme.colors.primary,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    
                    Column(
                      children: artSciencesCourses.map((course) {
                        return CourseTile(
                          courseName: course[0], 
                          imgPath: course[1], 
                          onTap: () {
                            Navigator.push(context, 
                            MaterialPageRoute(builder: (context) => 
                            CourseOfferInfoPage(
                              courseName: course[0],
                              imgPath: coverImgCourse[5],
                              courseDescription: course[2],
                               skillToLearn: course[3],
                              careerOppotunities: course[4],
                            )));
                          }
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}