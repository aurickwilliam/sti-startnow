import 'package:flutter/widgets.dart';

class TuitionFeeProvider extends ChangeNotifier{
 Map<String, Map<String, List<List>>> bscsTuition = {
  "1Y1": {
    "Units": [["23"]],
      "Cash": [
        ["Tuition Fees", "19,185"],
        ["Other School Fees", "7,632"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "28,708"],
        ["1st: Upon Enrollment", "28,708"],
        ["Total:", "28,708"],
      ],
      "Low Down": [
        ["Tuition Fees", "21,415"],
        ["Other School Fees", "8,548"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "31,854"],
        ["1st: Upon Enrollment", "6,370.80"],
        ["2nd: Prelims", "6,370.80"],
        ["3rd: Midterms", "6,370.80"],
        ["4th: Prefinals", "6,370.80"],
        ["5th: Finals", "6,370.80"],
        ["Total:", "31,854"],
      ],
  },
  "2Y1": {
    "Units": [["26"]],
      "Cash": [
        ["Tuition Fees", "26,800"],
       ["Other School Fees", "7,632"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "36,323"],
        ["1st: Upon Enrollment", "36,323"],
        ["Total:", "36,323"],
      ],
      "Low Down": [
        ["Tuition Fees", "29,895"],
        ["Other School Fees", "8,548"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "40,334"],
        ["1st: Upon Enrollment", "8,066.80"],
        ["2nd: Prelims", "8,066.80"],
        ["3rd: Midterms", "8,066.80"],
        ["4th: Prefinals", "8,066.80"],
        ["5th: Finals", "8,066.80"],
        ["Total:", "40,334"],
      ],
  },
  "3Y1": {
   "Units": [["21"]],
      "Cash": [
        ["Tuition Fees", "28,535"],
        ["Other School Fees", "7,632"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "38,058"],
        ["1st: Upon Enrollment", "38,058"],
        ["Total:", "38,058"],
      ],
      "Low Down": [
        ["Tuition Fees", "31,850"],
        ["Other School Fees", "8,548"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "42,289"],
        ["1st: Upon Enrollment", "8,457.80"],
        ["2nd: Prelims", "8,457.80"],
        ["3rd: Midterms", "8,457.80"],
        ["4th: Prefinals", "8,457.80"],
        ["5th: Finals", "8,457.80"],
        ["Total:", "42,289"],
      ],
  },
  "4Y1": {
    "Units": [["23"]],
      "Cash": [
        ["Tuition Fees", "19,185"],
        ["Other School Fees", "7,632"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "28,708"],
        ["1st: Upon Enrollment", "28,708"],
        ["Total:", "28,708"],
      ],
      "Low Down": [
        ["Tuition Fees", "21,415"],
        ["Other School Fees", "8,548"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "31,854"],
        ["1st: Upon Enrollment", "6,370.80"],
        ["2nd: Prelims", "6,370.80"],
        ["3rd: Midterms", "6,370.80"],
        ["4th: Prefinals", "6,370.80"],
        ["5th: Finals", "6,370.80"],
        ["Total:", "31,854"],
      ],
  }
 }; 
 
Map<String, Map<String, List<List>>> bsitTuition = {
  "1Y1": {
    "Units": [["26"]],
      "Cash": [
        ["Tuition Fees", "24,170"],
        ["Other School Fees", "7,632"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "33,693"],
        ["1st: Upon Enrollment", "33,693"],
        ["Total:", "33,693"],
      ],
      "Low Down": [
        ["Tuition Fees", "26,900"],
        ["Other School Fees", "8,548"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "37,419"],
        ["1st: Upon Enrollment", "7,483.80"],
        ["2nd: Prelims", "7,483.80"],
        ["3rd: Midterms", "7,483.80"],
        ["4th: Prefinals", "7,483.80"],
        ["5th: Finals", "7,483.80"],
        ["Total:", "37,419"],
      ],
  },
  "2Y1": {
    "Units": [["23"]],
      "Cash": [
        ["Tuition Fees", "26,855"],
       ["Other School Fees", "7,632"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "37,878"],
        ["1st: Upon Enrollment", "37,878"],
        ["Total:", "37,878"],
      ],
      "Low Down": [
        ["Tuition Fees", "29,965"],
        ["Other School Fees", "8,548"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "41,904"],
        ["1st: Upon Enrollment", "8,380.80"],
        ["2nd: Prelims", "8,380.80"],
        ["3rd: Midterms", "8,380.80"],
        ["4th: Prefinals", "8,380.80"],
        ["5th: Finals", "8,380.80"],
        ["Total:", "41,904"],
      ],
  },
  "3Y1": {
   "Units": [["21"]],
      "Cash": [
        ["Tuition Fees", "28,535"],
        ["Other School Fees", "7,632"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "38,058"],
        ["1st: Upon Enrollment", "38,058"],
        ["Total:", "38,058"],
      ],
      "Low Down": [
        ["Tuition Fees", "31,850"],
        ["Other School Fees", "8,548"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "42,289"],
        ["1st: Upon Enrollment", "8,457.80"],
        ["2nd: Prelims", "8,457.80"],
        ["3rd: Midterms", "8,457.80"],
        ["4th: Prefinals", "8,457.80"],
        ["5th: Finals", "8,457.80"],
        ["Total:", "42,289"],
      ],
  },
  "4Y1": {
    "Units": [["23"]],
      "Cash": [
        ["Tuition Fees", "19,185"],
        ["Other School Fees", "7,632"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "28,708"],
        ["1st: Upon Enrollment", "28,708"],
        ["Total:", "28,708"],
      ],
      "Low Down": [
        ["Tuition Fees", "21,415"],
        ["Other School Fees", "8,548"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "31,854"],
        ["1st: Upon Enrollment", "6,370.80"],
        ["2nd: Prelims", "6,370.80"],
        ["3rd: Midterms", "6,370.80"],
        ["4th: Prefinals", "6,370.80"],
        ["5th: Finals", "6,370.80"],
        ["Total:", "31,854"],
      ],
  }
 }; 

Map<String, Map<String, List<List>>> bscpeTuition = {
  "1Y1": {
    "Units": [["26"]],
      "Cash": [
        ["Tuition Fees", "24,670"],
        ["Other School Fees", "7,632"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "34,193"],
        ["1st: Upon Enrollment", "34,193"],
        ["Total:", "34,193"],
      ],
      "Low Down": [
        ["Tuition Fees", "27,535"],
        ["Other School Fees", "8,548"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "37,974"],
        ["1st: Upon Enrollment", "7,594.80"],
        ["2nd: Prelims", "7,594.80"],
        ["3rd: Midterms", "7,594.80"],
        ["4th: Prefinals", "7,594.80"],
        ["5th: Finals", "7,594.80"],
        ["Total:", "37,974"],
      ],
  },
  "2Y1": {
    "Units": [["28"]],
      "Cash": [
        ["Tuition Fees", "25,960"],
       ["Other School Fees", "7,632"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "35,483"],
        ["1st: Upon Enrollment", "35,483"],
        ["Total:", "35,483"],
      ],
      "Low Down": [
        ["Tuition Fees", "28,950"],
        ["Other School Fees", "8,548"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "39,389"],
        ["1st: Upon Enrollment", "7,877.80"],
        ["2nd: Prelims", "7,877.80"],
        ["3rd: Midterms", "7,877.80"],
        ["4th: Prefinals", "7,877.80"],
        ["5th: Finals", "7,877.80"],
        ["Total:", "39,389"],
      ],
  },
  "3Y1": {
   "Units": [["16"]],
      "Cash": [
        ["Tuition Fees", "24,610"],
        ["Other School Fees", "7,632"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "34,133"],
        ["1st: Upon Enrollment", "34,133"],
        ["Total:", "34,133"],
      ],
      "Low Down": [
        ["Tuition Fees", "27,475"],
        ["Other School Fees", "8,548"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "37,914"],
        ["1st: Upon Enrollment", "7,582.80"],
        ["2nd: Prelims", "7,582.80"],
        ["3rd: Midterms", "7,582.80"],
        ["4th: Prefinals", "7,582.80"],
        ["5th: Finals", "7,582.80"],
        ["Total:", "37,914"],
      ],
  },
  "4Y1": {
    "Units": [["28"]],
      "Cash": [
        ["Tuition Fees", "25,960"],
        ["Other School Fees", "7,632"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "35,483"],
        ["1st: Upon Enrollment", "35,483"],
        ["Total:", "35,483"],
      ],
      "Low Down": [
        ["Tuition Fees", "28,950"],
        ["Other School Fees", "8,548"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "39,389"],
        ["1st: Upon Enrollment", "7,877.80"],
        ["2nd: Prelims", "7,877.80"],
        ["3rd: Midterms", "7,877.80"],
        ["4th: Prefinals", "7,877.80"],
        ["5th: Finals", "7,877.80"],
        ["Total:", "39,389"],
      ],
  }
 }; 

Map<String, Map<String, List<List>>> bsbaTuition = {
  "1Y1": {
    "Units": [["18"]],
      "Cash": [
        ["Tuition Fees", "17,610"],
        ["Other School Fees", "7,632"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "27,133"],
        ["1st: Upon Enrollment", "27,133"],
        ["Total:", "27,133"],
      ],
      "Low Down": [
        ["Tuition Fees", "19,660"],
        ["Other School Fees", "8,548"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "30,099"],
        ["1st: Upon Enrollment", "6,019.80"],
        ["2nd: Prelims", "6,019.80"],
        ["3rd: Midterms", "6,019.80"],
        ["4th: Prefinals", "6,019.80"],
        ["5th: Finals", "6,019.80"],
        ["Total:", "30,099"],
      ],
  },
  "2Y1": {
    "Units": [["17"]],
      "Cash": [
        ["Tuition Fees", "12,505"],
       ["Other School Fees", "7,632"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "22,028"],
        ["1st: Upon Enrollment", "22,028"],
        ["Total:", "22,028"],
      ],
      "Low Down": [
        ["Tuition Fees", "13,935"],
        ["Other School Fees", "8,548"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "24,374"],
        ["1st: Upon Enrollment", "4,874.80"],
        ["2nd: Prelims", "4,874.80"],
        ["3rd: Midterms", "4,874.80"],
        ["4th: Prefinals", "4,874.80"],
        ["5th: Finals", "4,874.80"],
        ["Total:", "24,374"],
      ],
  },
  "3Y1": {
   "Units": [["18"]],
      "Cash": [
        ["Tuition Fees", "16,540"],
        ["Other School Fees", "7,632"],
        ["Miscellaneous Fees", "3,391"],
        ["Total:", "27,563"],
        ["1st: Upon Enrollment", "27,563"],
        ["Total:", "27,563"],
      ],
      "Low Down": [
        ["Tuition Fees", "27,475"],
        ["Other School Fees", "8,548"],
        ["Miscellaneous Fees", "3,391"],
        ["Total:", "30,384"],
        ["1st: Upon Enrollment", "6,076.80"],
        ["2nd: Prelims", "6,076.80"],
        ["3rd: Midterms", "6,076.80"],
        ["4th: Prefinals", "6,076.80"],
        ["5th: Finals", "6,076.80"],
        ["Total:", "30,384"],
      ],
  },
  "4Y1": {
    "Units": [["23"]],
      "Cash": [
        ["Tuition Fees", "19,185"],
        ["Other School Fees", "7,632"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "28,708"],
        ["1st: Upon Enrollment", "28,708"],
        ["Total:", "28,708"],
      ],
      "Low Down": [
        ["Tuition Fees", "21,415"],
        ["Other School Fees", "8,548"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "31,854"],
        ["1st: Upon Enrollment", "6,370.80"],
        ["2nd: Prelims", "6,370.80"],
        ["3rd: Midterms", "6,370.80"],
        ["4th: Prefinals", "6,370.80"],
        ["5th: Finals", "6,370.80"],
        ["Total:", "31,854"],
      ],
  }
 }; 

 Map<String, Map<String, List<List>>> bsaisTuition = {
  "1Y1": {
    "Units": [["27"]],
      "Cash": [
        ["Tuition Fees", "22,465"],
        ["Other School Fees", "7,632"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "31,988"],
        ["1st: Upon Enrollment", "31,988"],
        ["Total:", "31,988"],
      ],
      "Low Down": [
        ["Tuition Fees", "25,075"],
        ["Other School Fees", "8,548"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "35,514"],
        ["1st: Upon Enrollment", "7,102.80"],
        ["2nd: Prelims", "7,102.80"],
        ["3rd: Midterms", "7,102.80"],
        ["4th: Prefinals", "7,102.80"],
        ["5th: Finals", "7,102.80"],
        ["Total:", "35,514"],
      ],
  },
  "2Y1": {
    "Units": [["26"]],
      "Cash": [
        ["Tuition Fees", "24,390"],
        ["Other School Fees", "7,632"],
        ["Miscellaneous Fees", "4,691"],
        ["Total:", "36,713"],
        ["1st: Upon Enrollment", "36,713"],
        ["Total:", "36,713"],
      ],
      "Low Down": [
        ["Tuition Fees", "27,200"],
        ["Other School Fees", "8,548"],
        ["Miscellaneous Fees", "4,691"],
        ["Total:", "40,439"],
        ["1st: Upon Enrollment", "8,087.80"],
        ["2nd: Prelims", "8,087.80"],
        ["3rd: Midterms", "8,087.80"],
        ["4th: Prefinals", "8,087.80"],
        ["5th: Finals", "8,087.80"],
        ["Total:", "40,439"],
      ],
  },
  "3Y1": {
   "Units": [["18"]],
      "Cash": [
        ["Tuition Fees", "21,395"],
        ["Other School Fees", "7,632"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "30,828"],
        ["1st: Upon Enrollment", "30,828"],
        ["Total:", "30,828"],
      ],
      "Low Down": [
        ["Tuition Fees", "23,765"],
        ["Other School Fees", "8,548"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "34,204"],
        ["1st: Upon Enrollment", "6,840.80"],
        ["2nd: Prelims", "6,840.80"],
        ["3rd: Midterms", "6,840.80"],
        ["4th: Prefinals", "6,840.80"],
        ["5th: Finals", "6,840.80"],
        ["Total:", "34,204"],
      ],
  },
  "4Y1": {
    "Units": [["18"]],
      "Cash": [
        ["Tuition Fees", "16,540"],
        ["Other School Fees", "7,632"],
        ["Miscellaneous Fees", "3,391"],
        ["Total:", "27,563"],
        ["1st: Upon Enrollment", "27,563"],
        ["Total:", "27,563"],
      ],
      "Low Down": [
        ["Tuition Fees", "27,475"],
        ["Other School Fees", "8,548"],
        ["Miscellaneous Fees", "3,391"],
        ["Total:", "30,384"],
        ["1st: Upon Enrollment", "6,076.80"],
        ["2nd: Prelims", "6,076.80"],
        ["3rd: Midterms", "6,076.80"],
        ["4th: Prefinals", "6,076.80"],
        ["5th: Finals", "6,076.80"],
        ["Total:", "30,384"],
      ],
  }
 }; 

Map<String, Map<String, List<List>>> bsaTuition = {
  "1Y1": {
    "Units": [["27"]],
      "Cash": [
        ["Tuition Fees", "22,465"],
        ["Other School Fees", "7,632"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "31,988"],
        ["1st: Upon Enrollment", "31,988"],
        ["Total:", "31,988"],
      ],
      "Low Down": [
        ["Tuition Fees", "25,075"],
        ["Other School Fees", "8,548"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "35,514"],
        ["1st: Upon Enrollment", "7,102.80"],
        ["2nd: Prelims", "7,102.80"],
        ["3rd: Midterms", "7,102.80"],
        ["4th: Prefinals", "7,102.80"],
        ["5th: Finals", "7,102.80"],
        ["Total:", "35,514"],
      ],
  },
  "2Y1": {
    "Units": [["26"]],
      "Cash": [
        ["Tuition Fees", "24,390"],
       ["Other School Fees", "7,632"],
        ["Miscellaneous Fees", "4,691"],
        ["Total:", "36,713"],
        ["1st: Upon Enrollment", "36,713"],
        ["Total:", "36,713"],
      ],
      "Low Down": [
        ["Tuition Fees", "27,200"],
        ["Other School Fees", "8,548"],
        ["Miscellaneous Fees", "4,691"],
        ["Total:", "40,439"],
        ["1st: Upon Enrollment", "8,087.80"],
        ["2nd: Prelims", "8,087.80"],
        ["3rd: Midterms", "8,087.80"],
        ["4th: Prefinals", "8,087.80"],
        ["5th: Finals", "8,087.80"],
        ["Total:", "40,439"],
      ],
  },
  "3Y1": {
   "Units": [["21"]],
      "Cash": [
        ["Tuition Fees", "18,895"],
        ["Other School Fees", "7,632"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "28,418"],
        ["1st: Upon Enrollment", "28,418"],
        ["Total:", "28,418"],
      ],
      "Low Down": [
        ["Tuition Fees", "21,070"],
        ["Other School Fees", "8,548"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "31,509"],
        ["1st: Upon Enrollment", "6,301.80"],
        ["2nd: Prelims", "6,301.80"],
        ["3rd: Midterms", "6,301.80"],
        ["4th: Prefinals", "6,301.80"],
        ["5th: Finals", "6,301.80"],
        ["Total:", "31,509"],
      ],
  },
  "4Y1": {
    "Units": [["18"]],
      "Cash": [
        ["Tuition Fees", "16,540"],
        ["Other School Fees", "7,632"],
        ["Miscellaneous Fees", "3,391"],
        ["Total:", "27,563"],
        ["1st: Upon Enrollment", "27,563"],
        ["Total:", "27,563"],
      ],
      "Low Down": [
        ["Tuition Fees", "27,475"],
        ["Other School Fees", "8,548"],
        ["Miscellaneous Fees", "3,391"],
        ["Total:", "30,384"],
        ["1st: Upon Enrollment", "6,076.80"],
        ["2nd: Prelims", "6,076.80"],
        ["3rd: Midterms", "6,076.80"],
        ["4th: Prefinals", "6,076.80"],
        ["5th: Finals", "6,076.80"],
        ["Total:", "30,384"],
      ],
  }
 }; 

 Map<String, Map<String, List<List>>> bshmTuition = {
  "1Y1": {
    "Units": [["18"]],
      "Cash": [
        ["Tuition Fees", "19,415"],
        ["Other School Fees", "7,632"],
        ["Miscellaneous Fees", "1,941"],
        ["Total:", "28,988"],
        ["1st: Upon Enrollment", "28,988"],
        ["Total:", "28,988"],
      ],
      "Low Down": [
        ["Tuition Fees", "21,670"],
        ["Other School Fees", "8,548"],
        ["Miscellaneous Fees", "1,941"],
        ["Total:", "32,159"],
        ["1st: Upon Enrollment", "6,431.80"],
        ["2nd: Prelims", "6,431.80"],
        ["3rd: Midterms", "6,431.80"],
        ["4th: Prefinals", "6,431.80"],
        ["5th: Finals", "6,431.80"],
        ["Total:", "32,159"],
      ],
  },
  "2Y1": {
    "Units": [["22"]],
      "Cash": [
        ["Tuition Fees", "20,715"],
        ["Other School Fees", "7,632"],
        ["Miscellaneous Fees", "1,991"],
        ["Total:", "30,338"],
        ["1st: Upon Enrollment", "30,338"],
        ["Total:", "30,338"],
      ],
      "Low Down": [
        ["Tuition Fees", "23,095"],
        ["Other School Fees", "8,548"],
        ["Miscellaneous Fees", "1,991"],
        ["Total:", "33,634"],
        ["1st: Upon Enrollment", "6,726.80"],
        ["2nd: Prelims", "6,726.80"],
        ["3rd: Midterms", "6,726.80"],
        ["4th: Prefinals", "6,726.80"],
        ["5th: Finals", "6,726.80"],
        ["Total:", "33,634"],
      ],
  },
  "3Y1": {
   "Units": [["19"]],
      "Cash": [
        ["Tuition Fees", "19,200"],
        ["Other School Fees", "7,632"],
        ["Miscellaneous Fees", "1,991"],
        ["Total:", "28,823"],
        ["1st: Upon Enrollment", "28,823"],
        ["Total:", "28,823"],
      ],
      "Low Down": [
        ["Tuition Fees", "21,415"],
        ["Other School Fees", "8,548"],
        ["Miscellaneous Fees", "1,991"],
        ["Total:", "31,949"],
        ["1st: Upon Enrollment", "6,389.80"],
        ["2nd: Prelims", "6,389.80"],
        ["3rd: Midterms", "6,389.80"],
        ["4th: Prefinals", "6,389.80"],
        ["5th: Finals", "6,389.80"],
        ["Total:", "31,949"],
      ],
  },
  "4Y1": {
    "Units": [["21"]],
      "Cash": [
        ["Tuition Fees", "18,895"],
        ["Other School Fees", "7,632"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "28,418"],
        ["1st: Upon Enrollment", "28,418"],
        ["Total:", "28,418"],
      ],
      "Low Down": [
        ["Tuition Fees", "21,070"],
        ["Other School Fees", "8,548"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "31,509"],
        ["1st: Upon Enrollment", "6,301.80"],
        ["2nd: Prelims", "6,301.80"],
        ["3rd: Midterms", "6,301.80"],
        ["4th: Prefinals", "6,301.80"],
        ["5th: Finals", "6,301.80"],
        ["Total:", "31,509"],
      ],
  }
 }; 

 Map<String, Map<String, List<List>>> bacommTuition = {
  "1Y1": {
    "Units": [["18"]],
      "Cash": [
        ["Tuition Fees", "17,250"],
        ["Other School Fees", "7,632"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "26,773"],
        ["1st: Upon Enrollment", "26,773"],
        ["Total:", "26,773"],
      ],
      "Low Down": [
        ["Tuition Fees", "19,255"],
        ["Other School Fees", "8,548"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "29,694"],
        ["1st: Upon Enrollment", "5,938.80"],
        ["2nd: Prelims", "5,938.80"],
        ["3rd: Midterms", "5,938.80"],
        ["4th: Prefinals", "5,938.80"],
        ["5th: Finals", "5,938.80"],
        ["Total:", "29,694"],
      ],
  },
  "2Y1": {
    "Units": [["17"]],
      "Cash": [
        ["Tuition Fees", "14,915"],
        ["Other School Fees", "7,632"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "24,438"],
        ["1st: Upon Enrollment", "24,438"],
        ["Total:", "24,438"],
      ],
      "Low Down": [
        ["Tuition Fees", "16,630"],
        ["Other School Fees", "8,548"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "27,069"],
        ["1st: Upon Enrollment", "5,413.80"],
        ["2nd: Prelims", "5,413.80"],
        ["3rd: Midterms", "5,413.80"],
        ["4th: Prefinals", "5,413.80"],
        ["5th: Finals", "5,413.80"],
        ["Total:", "27,069"],
      ],
  },
  "3Y1": {
   "Units": [["18"]],
      "Cash": [
        ["Tuition Fees", "17,325"],
        ["Other School Fees", "7,632"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "26,848"],
        ["1st: Upon Enrollment", "26,848"],
        ["Total:", "26,848"],
      ],
      "Low Down": [
        ["Tuition Fees", "19,320"],
        ["Other School Fees", "8,548"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "29,759"],
        ["1st: Upon Enrollment", "5,951.80"],
        ["2nd: Prelims", "5,951.80"],
        ["3rd: Midterms", "5,951.80"],
        ["4th: Prefinals", "5,951.80"],
        ["5th: Finals", "5,951.80"],
        ["Total:", "29,759"],
      ],
  },
  "4Y1": {
    "Units": [["18"]],
      "Cash": [
        ["Tuition Fees", "19,415"],
        ["Other School Fees", "7,632"],
        ["Miscellaneous Fees", "1,941"],
        ["Total:", "28,988"],
        ["1st: Upon Enrollment", "28,988"],
        ["Total:", "28,988"],
      ],
      "Low Down": [
        ["Tuition Fees", "21,670"],
        ["Other School Fees", "8,548"],
        ["Miscellaneous Fees", "1,941"],
        ["Total:", "32,159"],
        ["1st: Upon Enrollment", "6,431.80"],
        ["2nd: Prelims", "6,431.80"],
        ["3rd: Midterms", "6,431.80"],
        ["4th: Prefinals", "6,431.80"],
        ["5th: Finals", "6,431.80"],
        ["Total:", "32,159"],
      ],
  }
 }; 

Map<String, Map<String, List<List>>> bmmaTuition = {
  "1Y1": {
    "Units": [["23"]],
      "Cash": [
        ["Tuition Fees", "20,065"],
        ["Other School Fees", "9,396"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "31,352"],
        ["1st: Upon Enrollment", "31,352"],
        ["Total:", "31,352"],
      ],
      "Low Down": [
        ["Tuition Fees", "22,405"],
        ["Other School Fees", "10,523"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "31,854"],
        ["1st: Upon Enrollment", "6,370.80"],
        ["2nd: Prelims", "6,370.80"],
        ["3rd: Midterms", "6,370.80"],
        ["4th: Prefinals", "6,370.80"],
        ["5th: Finals", "6,370.80"],
        ["Total:", "31,854"],
      ],
  },
  "2Y1": {
    "Units": [["17"]],
      "Cash": [
        ["Tuition Fees", "18,225"],
       ["Other School Fees", "9,396"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "29,512"],
        ["1st: Upon Enrollment", "29,512"],
        ["Total:", "29,512"],
      ],
      "Low Down": [
        ["Tuition Fees", "29,330"],
        ["Other School Fees", "10,523"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "32,744"],
        ["1st: Upon Enrollment", "6,548.80"],
        ["2nd: Prelims", "6,548.80"],
        ["3rd: Midterms", "6,548.80"],
        ["4th: Prefinals", "6,548.80"],
        ["5th: Finals", "6,548.80"],
        ["Total:", "32,744"],
      ],
  },
  "3Y1": {
   "Units": [["19"]],
      "Cash": [
        ["Tuition Fees", "25,110"],
        ["Other School Fees", "9,396"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "36,397"],
        ["1st: Upon Enrollment", "36,397"],
        ["Total:", "36,397"],
      ],
      "Low Down": [
        ["Tuition Fees", "28,020"],
        ["Other School Fees", "10,523"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "40,434"],
        ["1st: Upon Enrollment", "8,086.80"],
        ["2nd: Prelims", "8,086.80"],
        ["3rd: Midterms", "8,086.80"],
        ["4th: Prefinals", "8,086.80"],
        ["5th: Finals", "8,086.80"],
        ["Total:", "40,434"],
      ],
  },
  "4Y1": {
    "Units": [["23"]],
      "Cash": [
        ["Tuition Fees", "19,185"],
        ["Other School Fees", "7,632"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "28,708"],
        ["1st: Upon Enrollment", "28,708"],
        ["Total:", "28,708"],
      ],
      "Low Down": [
        ["Tuition Fees", "21,415"],
        ["Other School Fees", "8,548"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "31,854"],
        ["1st: Upon Enrollment", "6,370.80"],
        ["2nd: Prelims", "6,370.80"],
        ["3rd: Midterms", "6,370.80"],
        ["4th: Prefinals", "6,370.80"],
        ["5th: Finals", "6,370.80"],
        ["Total:", "31,854"],
      ],
  }
 }; 

Map<String, Map<String, List<List>>> bstmTuition = {
  "1Y1": {
    "Units": [["18"]],
      "Cash": [
        ["Tuition Fees", "15,085"],
        ["Other School Fees", "7,632"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "24,608"],
        ["1st: Upon Enrollment", "24,608"],
        ["Total:", "24,608"],
      ],
      "Low Down": [
        ["Tuition Fees", "16,840"],
        ["Other School Fees", "8,548"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "27,279"],
        ["1st: Upon Enrollment", "5,455.80"],
        ["2nd: Prelims", "5,455.80"],
        ["3rd: Midterms", "5,455.80"],
        ["4th: Prefinals", "5,455.80"],
        ["5th: Finals", "5,455.80"],
        ["Total:", "27,279"],
      ],
  },
  "2Y1": {
    "Units": [["20"]],
      "Cash": [
        ["Tuition Fees", "17,425"],
        ["Other School Fees", "7,632"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "26,948"],
        ["1st: Upon Enrollment", "26,948"],
        ["Total:", "26,948"],
      ],
      "Low Down": [
        ["Tuition Fees", "19,430"],
        ["Other School Fees", "8,548"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "29,869"],
        ["1st: Upon Enrollment", "5,973.80"],
        ["2nd: Prelims", "5,973.80"],
        ["3rd: Midterms", "5,973.80"],
        ["4th: Prefinals", "5,973.80"],
        ["5th: Finals", "5,973.80"],
        ["Total:", "29,869"],
      ],
  },
  "3Y1": {
   "Units": [["21"]],
      "Cash": [
        ["Tuition Fees", "18,895"],
        ["Other School Fees", "7,632"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "28,418"],
        ["1st: Upon Enrollment", "28,418"],
        ["Total:", "28,418"],
      ],
      "Low Down": [
        ["Tuition Fees", "21,070"],
        ["Other School Fees", "8,548"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "31,509"],
        ["1st: Upon Enrollment", "6,301.80"],
        ["2nd: Prelims", "6,301.80"],
        ["3rd: Midterms", "6,301.80"],
        ["4th: Prefinals", "6,301.80"],
        ["5th: Finals", "6,301.80"],
        ["Total:", "31,509"],
      ],
  },
  "4Y1": {
    "Units": [["17"]],
      "Cash": [
        ["Tuition Fees", "18,225"],
        ["Other School Fees", "9,396"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "29,512"],
        ["1st: Upon Enrollment", "29,512"],
        ["Total:", "29,512"],
      ],
      "Low Down": [
        ["Tuition Fees", "29,330"],
        ["Other School Fees", "10,523"],
        ["Miscellaneous Fees", "1,891"],
        ["Total:", "32,744"],
        ["1st: Upon Enrollment", "6,548.80"],
        ["2nd: Prelims", "6,548.80"],
        ["3rd: Midterms", "6,548.80"],
        ["4th: Prefinals", "6,548.80"],
        ["5th: Finals", "6,548.80"],
        ["Total:", "32,744"],
      ],
  }
 }; 

 String _selectedYear = "";
 String _selectedType = "Cash";
 List<List> _tuition = [];

 String _units = "0";
 List<List> breakDown = [];
 List<List> paymentSched = [];

 String get selectedYear {
  return _selectedYear;
 }

  String get selectedType {
  return _selectedType;
 }

 late Map<String, Map<String, List<List>>> _selectedCourse;

  void changeSeletectedYear(String yearLevel) {
    _selectedYear = yearLevel;
    _tuition = _selectedCourse[_selectedYear]?[selectedType] ?? [];
    _units = _selectedCourse[_selectedYear]?["Units"]?[0][0];

    separateData();

    notifyListeners();
  }

  void changeSeletectedType(String type) {
    _selectedType = type;
    _tuition = _selectedCourse[_selectedYear]?[selectedType] ?? [];

    separateData();

    notifyListeners();
  }

  void changeSelectedCourse(String acronym) {
    switch(acronym){
      case "BSCS":
        _selectedCourse = bscsTuition;
      case "BSIT":
        _selectedCourse = bsitTuition;
      case "BSCPE":
        _selectedCourse = bscpeTuition;
      case "BSBA":
        _selectedCourse = bsbaTuition;
      case "BSAIS":
        _selectedCourse = bsaisTuition;
      case "BSA":
        _selectedCourse = bsaTuition;
      case "BSHM":
        _selectedCourse = bshmTuition;
      case "BACOMM":
        _selectedCourse = bacommTuition;
      case "BMMA":
        _selectedCourse = bmmaTuition;
      case "BSTM":
        _selectedCourse = bstmTuition;
      default:
        _selectedCourse = bscsTuition;
    }
    notifyListeners();
  }

  Map<String, Map<String, List<List>>> get selectedCourse {
    return _selectedCourse;
  }

  Object get tuitionSelectedYear {
    return _selectedCourse[_selectedYear] ?? [];
  }

  String get units {
    return _units;
  }

  List<List> get tuitionType {
    return _tuition;
  }

  void separateData(){
    breakDown = [];
    paymentSched = [];

    for (var i = 0; i < 4; i++) {
      breakDown.add(_tuition[i]);
    }

    for (var i = 4; i < _tuition.length ; i++) {
      paymentSched.add(_tuition[i]);
    }

    notifyListeners();
  }
}