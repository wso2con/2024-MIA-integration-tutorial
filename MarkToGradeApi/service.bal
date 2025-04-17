import ballerina/http;
import ballerinax/wso2.controlplane as _;

function getGrade(int marks) returns string {
    if marks >= 80 {
        return "A+";
    } else if marks >= 75 && marks < 80 {
        return "A";
    } else if marks >= 70 && marks < 75 {
        return "A-";
    } else if marks >= 65 && marks < 70 {
        return "B+";
    } else if marks >= 60 && marks < 65 {
        return "B";
    } else if marks >= 55 && marks < 60 {
        return "B-";
    } else if marks >= 50 && marks < 55 {
        return "C+";
    } else if marks >= 45 && marks < 50 {
        return "C";
    } else if marks >= 40 && marks < 45 {
        return "C-";
    } else if marks >= 35 && marks < 40 {
        return "S";
    } else if marks < 35 {
        return "F";
    } 

    return "";
}

service / on new http:Listener(9090) {

    # A resource for returning grades based on marks
    # + marks - the input marks
    # + return - json with the grade for the marks
    resource function get get_grade(int marks) returns json|error {
        string grade = getGrade(marks);
        json gradeJson = {"grade": grade};

        return gradeJson;
    }
}
