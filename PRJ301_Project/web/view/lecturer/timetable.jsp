
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="helper" class="util.DateTimeHelper"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="${pageContext.request.contextPath}/CSS/timetable.css" rel="stylesheet"/>

    </head>
    <body style="margin: 0;
          padding: 0;
          box-sizing: border-box;">


        <div style="  display: flex;
             justify-content: center;
             align-content: center;">
            <div class="col-md-8">
                <h1 style="font-size: 40px; font-weight: inherit; padding-right: 400px"><span>FPT University Academic Portal</span>
                </h1>
            </div>
            <div>
                <table>
                    <tbody><tr>
                            <td colspan="2" style="padding-right: 150px"><strong>FAP mobile app (myFAP) is ready at</strong></td>
                        </tr>
                        <tr >
                            <td><a href="https://apps.apple.com/app/id1527723314">
                                    <img src="https://fap.fpt.edu.vn/images/app-store.svg" style="width: 120px; height: 40px" alt="apple store"></a></td>
                            <td><a href="https://play.google.com/store/apps/details?id=com.fuct">
                                    <img  src="https://fap.fpt.edu.vn/images/play-store.svg" style="width: 120px; height: 40px" alt="google store"></a></td>
                        </tr>
                    </tbody></table>
            </div>
        </div>      
        <div style="-moz-box-shadow:    3px 3px 5px 6px #ccc;
                 -webkit-box-shadow: 3px 3px 5px 6px #ccc;
                 box-shadow:         3px 3px 5px 6px #ccc;
                 border-radius: 5px;
                 margin-right: 1250px;
                 margin-top: 50px;
                 background-color: #ccccff">
            <div style="padding-bottom: 20px; color: #3366CC"> Lecturer: <input type="text" readonly="readonly" value="${requestScope.lecturer.name}"/></div>
            <form action="timetable" method="GET">
                <input type="hidden" name="lid" value="${param.lid}"/>
                <div style="color: #3366CC  "> From: <input  type="date" name="from" value="${requestScope.from}"/>
                    To: <input type="date" name="to" value="${requestScope.to}"/>
                    <input style="background-color: black; color: white" type="submit" value="View"/></div>
        </div>
    </form>
    <table border="1px" style="width: 100%; margin-top: 80px">
        <tr>
            <td> </td>
            <c:forEach items="${requestScope.dates}" var="d">
                <td style="background-color: #3366CC">${d}<br/>${helper.getDayNameofWeek(d)}</td>
                </c:forEach>
        </tr>
        <c:forEach items="${requestScope.slots}" var="slot">
            <tr>
                <td style="background-color: #99ccff" >${slot.description}</td>
                <c:forEach items="${requestScope.dates}" var="d">
                    <td>
                        <c:forEach items="${requestScope.sessions}" var="ses">
                            <c:if test="${helper.compare(ses.date,d) eq 0 and (ses.timeslot.id eq slot.id)}">
                                <a style="color: #3366ff" href="att?id=${ses.id}">${ses.group.name}-${ses.group.subject.name}</a>
                                <br/>
                                ${ses.room.name} <br>
                                <c:if test="${ses.attandated}">
                                    <div style="color: green">(Attended)</div>
                                </c:if>
                                <c:if test="${!ses.attandated}">
                                    <div style="color: crimson">(Not yet)</div>
                                </c:if>
                                
                            </c:if>

                        </c:forEach>
                    </td>
                </c:forEach>
            </tr>
        </c:forEach>
    </table>
            
            <h4 style=" text-align: center; background-color: red;margin-top: 200px ">Welcome to FPT University</h4>

</body>
</html>
