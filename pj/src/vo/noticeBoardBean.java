package vo;

import java.sql.Date;

public class noticeBoardBean {
	private int board_total;
	private String board_subject;
	private int board_readcount;
	private Date board_date;

	public int getBoard_total() {
		return board_total;
	}

	public void setBoard_total(int board_total) {
		this.board_total = board_total;
	}

	public String getBoard_subject() {
		return board_subject;
	}

	public void setBoard_subject(String board_subject) {
		this.board_subject = board_subject;
	}

	public int getBoard_readcount() {
		return board_readcount;
	}

	public void setBoard_readcount(int board_readcount) {
		this.board_readcount = board_readcount;
	}

	public Date getBoard_date() {
		return board_date;
	}

	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}

}
