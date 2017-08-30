package Jonathan;

import java.util.Calendar;

public class Standard extends AuditedFile{
	int proposalId;
	public Standard( int fId, User writer, String title, int proposalId, String content, Calendar upload, Calendar deadline, int agree, int disagree ){
		super( fId, writer, title, content, upload, deadline, agree, disagree );
		this.proposalId = proposalId;
	}
	public String toString( String preBlock ){
		return 	preBlock + "Standard :\n" + super.toString( preBlock );
	}
	
	public String toString(){
		return toString("");
	}

	public int getProposalId(){ return proposalId; }
}
