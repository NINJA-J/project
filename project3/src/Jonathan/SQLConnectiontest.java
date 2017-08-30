package Jonathan;

import static org.junit.Assert.*;

import java.util.Calendar;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class SQLConnectiontest {
	@Before
	public void before() throws Exception { 
	} 

	@After
	public void after() throws Exception { 
	} 

	/** 
	* 
	* Method: connectToDatabase(String url, String baseName, String user, String pswd) 
	* 
	*/ 
	@Test
	public void testConnectToDatabase() throws Exception { 
	//TODO: Test goes here...
	    assertEquals(true,new SQLConnection().connectToDatabase("localhost:3306", "dbgirl", "root", "111"));
	} 

	/** 
	* 
	* Method: closeConn() 
	* 
	*/ 
	@Test
	public void testCloseConn() throws Exception { 
	//TODO: Test goes here...
	    SQLConnection DB = new SQLConnection();
	    DB.connectToDatabase("localhost:3306", "dbgirl", "root", "111") ;
	    assertEquals(SQLConnection.SUCCESS,DB.chkLoginInfo("123", "123"));
	    assertEquals(SQLConnection.PSWD_ERROR,DB.chkLoginInfo("123", "798"));
	    assertEquals(SQLConnection.USER_INEXIST,DB.chkLoginInfo("123456789", "123"));
	} 

	/** 
	* 
	* Method: chkLoginInfo(String uName, String uPswd) 
	* 
	*/ 
	@Test
	public void testChkLoginInfo() throws Exception { 
	//TODO: Test goes here...

	    SQLConnection DB = new SQLConnection();
	    DB.connectToDatabase("localhost:3306", "dbgirl", "root", "111") ;
	    assertEquals(1, DB.getLoginId("123"));
	    assertEquals(-1, DB.getLoginId("123456789"));
	} 

	/** 
	* 
	* Method: getLoginId(String name) 
	* 
	*/ 
	@Test
	public void testGetLoginId() throws Exception { 
	//TODO: Test goes here...
	    SQLConnection DB = new SQLConnection();
	    DB.connectToDatabase("localhost:3306", "dbgirl", "root", "111") ;
	    assertEquals(5, DB.getLoginId("11111"));
	    assertEquals(-1, DB.getLoginId("159159"));
	} 

	/** 
	* 
	* Method: getProposalAmountByUId(int uId) 
	* 
	*/ 
	@Test
	public void testGetProposalAmountByUId() throws Exception { 
	//TODO: Test goes here...
	    SQLConnection DB = new SQLConnection();
	    DB.connectToDatabase("localhost:3306", "dbgirl", "root", "111") ;
	    assertEquals(5, DB.getProposalAmountByUId(2));
	} 

	/** 
	* 
	* Method: getStandardAmountByUId(int uId) 
	* 
	*/ 
	@Test
	public void testGetStandardAmountByUId() throws Exception { 
	//TODO: Test goes here...
	    SQLConnection DB = new SQLConnection();
	    DB.connectToDatabase("localhost:3306", "dbgirl", "root", "111") ;
	    assertEquals(2, DB.getStandardAmountByUId(2));
	} 

	/** 
	* 
	* Method: addLoginInfo(String uName, String uPswd) 
	* 
	*/ 
	@Test
	public void testAddLoginInfo() throws Exception { 
	//TODO: Test goes here...
	    SQLConnection DB = new SQLConnection();
	    DB.connectToDatabase("localhost:3306", "dbgirl", "root", "111") ;
	    assertEquals(SQLConnection.USER_EXIST, DB.addLoginInfo("123", "123"));
	    assertEquals(SQLConnection.SUCCESS, DB.addLoginInfo("162", "162"));
	} 

	/** 
	* 
	* Method: createCalendarForNow() 
	* 
	*/ 
	@Test
	public void testCreateCalendarForNow() throws Exception { 
	//TODO: Test goes here... 
	} 

	/** 
	* 
	* Method: createCalendar(int year, int month, int day) 
	* 
	*/ 
	@Test
	public void testCreateCalendar() throws Exception { 
	//目前未改正
	    Calendar c=Calendar.getInstance();
	    c.set(2017,6,7,0,0,0);
	    assertEquals(c.getTime().toString(),new SQLConnection().createCalendar(2017,7,7).getTime().toString());
	} 

	/** 
	* 
	* Method: createCalendarByString(String date) 
	* 
	*/ 
	@Test
	public void testCreateCalendarByString() throws Exception { 
	//TODO: Test goes here...
	    Calendar c=Calendar.getInstance();
	    c.set(2017, 6-1, 7, 0, 0, 0);
	    assertEquals(c.getTime().toString(),new SQLConnection().createCalendarByString("2017/06/07").getTime().toString());
	} 

	/** 
	* 
	* Method: getProposalByUName(String uName) 
	* 
	*/ 
	@Test
	public void testGetProposalByUName() throws Exception { 
	//TODO: Test goes here... 
	} 

	/** 
	* 
	* Method: getProposalById(int pId) 
	* 
	*/ 
	@Test
	public void testGetProposalById() throws Exception { 
	//TODO: Test goes here...
	    SQLConnection DB=new SQLConnection();
	    DB.connectToDatabase("localhost:3306", "dbgirl", "root", "111") ;
	    User U=new User(2,"11111",'1',DB.createCalendar(1997,8,07),"11111","1",1,-1,-1,'1');
	    Proposal P=new Proposal(U,"ffff","i have a apple.",DB.createCalendar(2017,8,26),DB.createCalendar(1997,01,01),2,3);
	    assertEquals(P, DB.getProposalById(1));
//	    User U2=new User(
//	            6,
//	            new String( "小直".getBytes(), Charset.forName("utf-8") ),
//	            'M',DB.createCalendar(1997,2,7),"北京工业大学","13522553799",-1,-1,-1,'5');
//	    U2.showUname(U2);
//	    Proposal P2=new Proposal(U2,"关于宿舍更换纱窗","宿舍急于更换宿舍的纱窗，纱窗坏了进了好多蚊子，很困扰",DB.createCalendar(2017,8,27),DB.createCalendar(2017,9,10),100,0);
//	    assertEquals(P2.toString(),DB.getProposalById(8).toString());
	} 

	/** 
	* 
	* Method: getProposalByTitle(String title) 
	* 
	*/ 
	@Test
	public void testGetProposalByTitle() throws Exception { 
	//TODO: Test goes here... 
	} 

	/** 
	* 
	* Method: getProposalForAll() 
	* 
	*/ 
	@Test
	public void testGetProposalForAll() throws Exception { 
	//TODO: Test goes here... 
	} 

	/** 
	* 
	* Method: addProposal(String uName, Calendar date, Calendar endline, String title, String content) 
	* 
	*/ 
	@Test
	public void testAddProposal() throws Exception { 
	//TODO: Test goes here... 
	} 

	/** 
	* 
	* Method: addCommentForProposal(int proposalId, String comment, int writerId) 
	* 
	*/ 
	@Test
	public void testAddCommentForProposal() throws Exception { 
	//TODO: Test goes here... 
	} 

	/** 
	* 
	* Method: getCommentForProposal(int proposalId) 
	* 
	*/ 
	@Test
	public void testGetCommentForProposal() throws Exception { 
	//TODO: Test goes here... 
	} 

	/** 
	* 
	* Method: getStandardByWriter(String uName) 
	* 
	*/ 
	@Test
	public void testGetStandardByWriter() throws Exception { 
	//TODO: Test goes here... 
	} 

	/** 
	* 
	* Method: getStandardById(int sId) 
	* 
	*/ 
	@Test
	public void testGetStandardById() throws Exception { 
	//TODO: Test goes here... 
	} 

	/** 
	* 
	* Method: getStangardByTitle(String title) 
	* 
	*/ 
	@Test
	public void testGetStangardByTitle() throws Exception { 
	//TODO: Test goes here... 
	} 

	/** 
	* 
	* Method: getStandardForAll() 
	* 
	*/ 
	@Test
	public void testGetStandardForAll() throws Exception { 
	//TODO: Test goes here... 
	} 

	/** 
	* 
	* Method: addStandard(String uName, Calendar date, Calendar endline, String title, String content) 
	* 
	*/ 
	@Test
	public void testAddStandard() throws Exception { 
	//TODO: Test goes here... 
	} 

	/** 
	* 
	* Method: addCommentForStandard(int standardId, String comment, int writerId) 
	* 
	*/ 
	@Test
	public void testAddCommentForStandard() throws Exception { 
	//TODO: Test goes here... 
	} 

	/** 
	* 
	* Method: getCommentForStandard(int standardId) 
	* 
	*/ 
	@Test
	public void testGetCommentForStandard() throws Exception { 
	//TODO: Test goes here... 
	} 

	/** 
	* 
	* Method: addStandardToProposal(int standardId, int proposalId) 
	* 
	*/ 
	@Test
	public void testAddStandardToProposal() throws Exception { 
	//TODO: Test goes here... 
	} 

	/** 
	* 
	* Method: chkAllStandardUnderProposal(int pId) 
	* 
	*/ 
	@Test
	public void testChkAllStandardUnderProposal() throws Exception { 
	//TODO: Test goes here... 
	} 

	/** 
	* 
	* Method: chkUserForAll() 
	* 
	*/ 
	@Test
	public void testChkUserForAll() throws Exception { 
	//TODO: Test goes here... 
	} 

	/** 
	* 
	* Method: chkUserByName(String name) 
	* 
	*/ 
	@Test
	public void testChkUserByName() throws Exception { 
	//TODO: Test goes here... 
	} 

	/** 
	* 
	* Method: chkUserById(int uId) 
	* 
	*/ 
	@Test
	public void testChkUserById() throws Exception { 
	//TODO: Test goes here... 
	} 

	/** 
	* 
	* Method: getEnrollRequestFor(User admin) 
	* 
	*/ 
	@Test
	public void testGetEnrollRequestFor() throws Exception { 
	//TODO: Test goes here... 
	} 

	/** 
	* 
	* Method: permitEnrollRequest(User admin, EnrollRequest req) 
	* 
	*/ 
	@Test
	public void testPermitEnrollRequest() throws Exception { 
	//TODO: Test goes here... 
	} 

	/** 
	* 
	* Method: rejectEnrollRequest(User admin, EnrollRequest req) 
	* 
	*/ 
	@Test
	public void testRejectEnrollRequest() throws Exception { 
	//TODO: Test goes here... 
	} 

	/** 
	* 
	* Method: addUser(int uId, String name, String gender, String bDate, String address, String tel, String referrer, String industry, String committee) 
	* 
	*/ 
	@Test
	public void testAddUser() throws Exception { 
	//TODO: Test goes here... 
	} 

	
}
