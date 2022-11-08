

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

    </head>
    <body style=" margin: 0;
          padding: 0;
          box-sizing: border-box;
          ">
        <div>
            <div style="display: flex;
                 justify-content: space-between;
                 margin-left: 50px;
                 margin-right: 50px;">
                <div><img style="width: 300px; padding-right: 750px" src="${pageContext.request.contextPath}/img/logofpt.png" alt="fptlogo"/></div>
                <div><table>
                        <tbody><tr>
                                <td colspan="2" style="padding-right: 150px"><strong>FAP mobile app (myFAP) is ready at</strong></td>
                            </tr>
                            <tr >
                                <td><a href="https://apps.apple.com/app/id1527723314">
                                        <img src="https://fap.fpt.edu.vn/images/app-store.svg" style="width: 120px; height: 40px" alt="apple store"></a></td>
                                <td><a href="https://play.google.com/store/apps/details?id=com.fuct">
                                        <img  src="https://fap.fpt.edu.vn/images/play-store.svg" style="width: 120px; height: 40px" alt="google store"></a></td>
                            </tr>
                        </tbody></table></div>
            </div>
            <div style="  -moz-box-shadow:    3px 3px 5px 6px #ccc;
                 -webkit-box-shadow: 3px 3px 5px 6px #ccc;
                 box-shadow:         3px 3px 5px 6px #ccc;
                 border-radius: 5px;
                 margin-right: 1250px;
                 margin-top: 50px;
                 background-color: #99ccff;

                 ">
                Take attendance for Group: ${requestScope.ses.group.name} <br/>
                Subject: ${requestScope.ses.group.subject.name} <br/>
                Room: ${requestScope.ses.room.name} <br/>
                Date: ${requestScope.ses.date} - ${requestScope.ses.timeslot.description}<br/>
                Attended: <span style="color: red;"> ${requestScope.ses.attandated?"Yes":"No"} </span>            
            </div> 
        </div>
        <form action="att" method="POST">
            <input type="hidden" name="sesid" value="${param.id}"/>
            <table border="1px" style="width: 100%; margin-top: 80px; ">
                <tr style="background-color: #3366CC">
                    <td>No.</td>
                    <td>StudentID</td>
                    <td>Full Name</td>
                    <td>Present</td>
                    <td>Absent</td>
                    <td>Description</td>
                </tr>
                <c:forEach items="${requestScope.ses.attandances}" var="a" varStatus="loop">
                    <tr>
                        <td>${loop.index+1}</td>
                        <td>${a.student.id}
                            <input type="hidden" name="stdid" value="${a.student.id}"/>
                        </td>
                        <td>${a.student.name}</td>
                        <td><input style="color: green" type="radio"
                                   <c:if test="${a.present}">
                                       checked="checked"
                                   </c:if>
                                   name="present${a.student.id}" value="present" /></td>
                        <td><input type="radio"
                                   <c:if test="${!a.present}">
                                       checked="checked"
                                   </c:if>
                                   name="present${a.student.id}" value="absent" /></td>
                        <td><input type="text" name="description${a.student.id}" value="${a.description}" /></td>
                    </tr>   

                </c:forEach>

            </table>
            <input style="background-color: black; color: white"type="submit" value="Save"/>
        </form>

        <h4 style=" text-align: center; background-color: red;margin-top: 200px ">Thank you and see you next time!</h4>
    </body>
</html>
