package com.trashbox.vo;

import java.io.Serializable;
import java.util.Date;

public class Message implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private int 	no;
	private int 	senderNo;
	private int 	receiverNo;
	private String 	content;
	private Date    registrationDate;
	private boolean checked;
	private boolean saved;
    private boolean removeSender;
    private boolean removeReceiver;

	
	@Override
	public String toString() {
		return "Message [no=" + no + ", senderNo=" + senderNo + ", receiverNo=" + receiverNo + ", content=" + content
				+ ", registrationDate=" + registrationDate + ", checked=" + checked + ", saved=" + saved
				+ ", removeSender=" + removeSender + ", removeReceiver=" + removeReceiver + "]";
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getSenderNo() {
		return senderNo;
	}

	public void setSenderNo(int senderNo) {
		this.senderNo = senderNo;
	}

	public int getReceiverNo() {
		return receiverNo;
	}

	public void setReceiverNo(int receiverNo) {
		this.receiverNo = receiverNo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegistrationDate() {
		return registrationDate;
	}

	public void setRegistrationDate(Date registrationDate) {
		this.registrationDate = registrationDate;
	}

	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}

	public boolean isSaved() {
		return saved;
	}

	public void setSaved(boolean saved) {
		this.saved = saved;
	}

	public boolean isRemoveSender() {
		return removeSender;
	}

	public void setRemoveSender(boolean removeSender) {
		this.removeSender = removeSender;
	}

	public boolean isRemoveReceiver() {
		return removeReceiver;
	}

	public void setRemoveReceiver(boolean removeReceiver) {
		this.removeReceiver = removeReceiver;
	}
	
	
	
	

}
