package Jonathan;

import java.util.Calendar;

public class Standard extends AuditedFile{

	int proposalId;

	public Standard( int fId, User writer, String title, String content, Calendar upload, Calendar deadline, int agree, int disagree, char status, int pId ){
		super( fId, writer, title, content, upload, deadline, agree, disagree, status );
		this.proposalId = pId;
	}

	public int getProposalIdLinked(){ return proposalId; }

	public String toString( String preBlock ){
		return 	preBlock + "Standard :\n" + super.toString( preBlock );
	}

	public String toString(){
		return toString("");
	}
	public String analysisStatus(char status)
	{
		if (status=='1'){
			return "待推荐";
		}
		else if (status=='2'){
			return "待备案";
		}
		else if (status=='3'){
			return "待立案";
		}
		else{
			return "已启动";
		}
	}
}