package admin.complaint;

public class ComplaintVO {
	private int idx;
	private String part;
	private int partIdx;
	private String cpMid;
	private String cpContent;
	private String cpDate;
	
	private String title;
	private String nickName;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	private String mid;
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getPart() {
		return part;
	}
	@Override
	public String toString() {
		return "ComplaintVO [idx=" + idx + ", part=" + part + ", partIdx=" + partIdx + ", cpMid=" + cpMid
				+ ", cpContent=" + cpContent + ", cpDate=" + cpDate + ", getIdx()=" + getIdx() + ", getPart()="
				+ getPart() + ", getPartIdx()=" + getPartIdx() + ", getCpMid()=" + getCpMid() + ", getCpContent()="
				+ getCpContent() + ", getCpDate()=" + getCpDate() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
	public void setPart(String part) {
		this.part = part;
	}
	public int getPartIdx() {
		return partIdx;
	}
	public void setPartIdx(int partIdx) {
		this.partIdx = partIdx;
	}
	public String getCpMid() {
		return cpMid;
	}
	public void setCpMid(String cpMid) {
		this.cpMid = cpMid;
	}
	public String getCpContent() {
		return cpContent;
	}
	public void setCpContent(String cpContent) {
		this.cpContent = cpContent;
	}
	public String getCpDate() {
		return cpDate;
	}
	public void setCpDate(String cpDate) {
		this.cpDate = cpDate;
	}
}
