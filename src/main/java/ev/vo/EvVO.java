package ev.vo;

public class EvVO {
	private String statNm, chgerId, addr, lat, lng, useTime, busiCall, zcode;

	public EvVO(String statNm, String chgerId, String addr, String lat, String lng, String useTime, String busiCall, String zcode) {
		super();
		this.statNm = statNm;
		this.chgerId = chgerId;
		this.addr = addr;
		this.lat = lat;
		this.lng = lng;
		this.useTime = useTime;
		this.busiCall = busiCall;
		this.zcode = zcode;
	}

	public String getStatNm() {
		return statNm;
	}

	public void setStatNm(String statNm) {
		this.statNm = statNm;
	}

	public String getZcode() {
		return zcode;
	}

	public void setZcode(String zcode) {
		this.zcode = zcode;
	}

	public String getChgerId() {
		return chgerId;
	}

	public void setChgerId(String chgerId) {
		this.chgerId = chgerId;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public String getUseTime() {
		return useTime;
	}

	public void setUseTime(String useTime) {
		this.useTime = useTime;
	}

	public String getBusiCall() {
		return busiCall;
	}

	public void setBusiCall(String busiCall) {
		this.busiCall = busiCall;
	}
}
