package Model;

public class BoardDTO {
	
	private int QNA_SEQ;
	private String title;
	private String content;
	private String fileName;
	private String QNA_JOINDATE; // 작성일
	private String writer;
	private int cnt; // 조회수
	
	
	public BoardDTO(int QNA_SEQ, String title, String content, String fileName, String QNA_JOINDATE, String writer, int cnt) {
		super();
		this.QNA_SEQ = QNA_SEQ;
		this.title = title;
		this.content = content;
		this.fileName = fileName;
		this.QNA_JOINDATE = QNA_JOINDATE;
		this.writer = writer;
		this.cnt = cnt;
	}


	public int getQNA_SEQ() {
		return QNA_SEQ;
	}


	public void setQNA_SEQ(int QNA_SEQ) {
		this.QNA_SEQ = QNA_SEQ;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getFileName() {
		return fileName;
	}


	public void setFileName(String fileName) {
		this.fileName = fileName;
	}


	public String getQNA_JOINDATE() {
		return QNA_JOINDATE;
	}


	public void setQNA_JOINDATE(String QNA_JOINDATE) {
		this.QNA_JOINDATE= QNA_JOINDATE;
	}


	public String getWriter() {
		return writer;
	}


	public void setWriter(String writer) {
		this.writer = writer;
	}


	public int getCnt() {
		return cnt;
	}


	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	

}
