package com.lanyuan.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 费率实体
 * @author lanyuan
 * @date 2014-1-1
 * @Email: mmm333zzz520@163.com
 * @version 1.0v
 */
public class UserRates implements Serializable{

	/**
	 * @author lanyuan
	 * @date 2014-1-1
	 * @Email: mmm333zzz520@163.com
	 * @version 1.0v
	 */
	private static final long serialVersionUID = 1L;
	
	private int id;
	private String parentNumber;
	private String userName;
	private String tradingRates;//交易费率 
	private String channelname;
	private String settlementCosts;
	private String settlementCaps;
	private String mark;
	private Date updateTime;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTradingRates() {
		return tradingRates;
	}
	public void setTradingRates(String tradingRates) {
		this.tradingRates = tradingRates;
	}
	public String getChannelname() {
		return channelname;
	}
	public void setChannelname(String channelname) {
		this.channelname = channelname;
	}
	public String getSettlementCosts() {
		return settlementCosts;
	}
	public void setSettlementCosts(String settlementCosts) {
		this.settlementCosts = settlementCosts;
	}
	public String getSettlementCaps() {
		return settlementCaps;
	}
	public void setSettlementCaps(String settlementCaps) {
		this.settlementCaps = settlementCaps;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	@Override
	public String toString() {
		return "Rates [id=" + id + ", userName=" + userName + ", tradingRates=" + tradingRates + ", channelname=" + channelname + ", settlementCosts=" + settlementCosts + ", settlementCaps=" + settlementCaps + ", updateTime=" + updateTime + "]";
	}
	public String getMark() {
		return mark;
	}
	public void setMark(String mark) {
		this.mark = mark;
	}
	public String getParentNumber() {
		return parentNumber;
	}
	public void setParentNumber(String parentNumber) {
		this.parentNumber = parentNumber;
	}

}
