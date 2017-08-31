<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file ="stdafx.jsp"%>
<%
    ArrayList<Proposal> pList = con.getProposalForAll();
    int pageIndex = 1;
    if( request.getParameter( "page" ) != null )
        pageIndex = Integer.valueOf( request.getParameter( "page" ) );
    int pageRange = 5;

    int indexM = pList.size() / pageRange + 1;
    if( pList.size() % pageRange == 0 && pList.size() > 0)
        indexM--;
    int indexS = ( pageIndex - 1 ) * pageRange;
    int indexE = ( pageIndex * pageRange > pList.size() ? pList.size() : pageIndex * pageRange );

    int indexB = ( pageIndex == 1      ? 1      : pageIndex - 1 );
    int indexF = ( pageIndex == indexM ? indexM : pageIndex + 1 );
%>

