    package com.erp.action;
    import net.sourceforge.stripes.action.*;
    import net.sourceforge.stripes.ajax.JavaScriptResolution;
    import com.erp.pojo.DailyStockRecord;
    import com.erp.pojo.Grn;
    import com.erp.pojo.PurchaseOrder;
    import com.erp.pojo.Requisition;
    import com.erp.constants.PermissionConstants;
    import com.erp.dao.*;
    import com.google.inject.Inject;
    import javax.annotation.security.RolesAllowed;
    import java.util.*;
    import java.text.SimpleDateFormat;
    import java.text.ParseException;
    import java.text.DateFormat;

    import org.slf4j.Logger;
    import org.slf4j.LoggerFactory;

    /**
    * Created by IntelliJ IDEA.
    * User: Milind
    * Date: Mar 28, 2012
    * Time: 11:57:48 AM
    * To change this template use File | Settings | File Templates.
    */
    @HttpCache(allow = false)
    public class ReportActionBean extends BaseActionBean{
    Logger logger= LoggerFactory.getLogger(ReportActionBean.class);
    private final String REPORT="jsp/reports.jsp";
    @Inject
    protected StoreIssueDao storeissuedao;
    @Inject
    ItemDao itemdao;
    @Inject  protected GrnDao grndao;
         @Inject
         PurchaseOrderDao purchaseorderdao;
          @Inject
          RequisitionDao requisitiondao;
    private String stock;
    private String search;
    private String daily;
    private int month,year;
    private String fromdate,todate;
    private int y;
    private String itemcodetxt;
    private String sdate;
    private List<DailyStockRecord> dailystocktoday,dailyLedger;
    private List<Grn> grnHistory;
           private List<PurchaseOrder> poHistory;
          private List<Requisition> reqHistory;
    private List dailystock;
    private List<String> itemcodelst;

        public List<Requisition> getReqHistory() {
            return reqHistory;
        }

        public void setReqHistory(List<Requisition> reqHistory) {
            this.reqHistory = reqHistory;
        }

        public List<PurchaseOrder> getPoHistory() {
            return poHistory;
        }

        public void setPoHistory(List<PurchaseOrder> poHistory) {
            this.poHistory = poHistory;
        }

        public List<DailyStockRecord> getDailyLedger() {
    return dailyLedger;
    }

    public void setDailyLedger(List<DailyStockRecord> dailyLedger) {
    this.dailyLedger = dailyLedger;
    }

    public String getFromdate() {
    return fromdate;
    }

    public void setFromdate(String fromdate) {
    this.fromdate = fromdate;
    }

    public String getTodate() {
    return todate;
    }

    public void setTodate(String todate) {
    this.todate = todate;
    }

    public String getItemcodetxt() {
    return itemcodetxt;
    }

    public void setItemcodetxt(String itemcodetxt) {
    this.itemcodetxt = itemcodetxt;
    }

    public int getY() {
    return y;
    }

    public void setY(int y) {
    this.y = y;
    }

    public int getMonth() {

    return month;
    }

    public void setMonth(int month) {
    this.month = month;
    }

    public int getYear() {
    return year;
    }

    public void setYear(int year) {
    this.year = year;
    }

    public String getSdate() {
    return sdate;
    }

    public void setSdate(String sdate) {
    this.sdate = sdate;
    }

    public List getDailystock() {
    return dailystock;
    }

    public void setDailystock(List dailystock) {
    this.dailystock = dailystock;
    }

    public List<DailyStockRecord> getDailystocktoday() {
    return dailystocktoday;
    }

    public void setDailystocktoday(List<DailyStockRecord> dailystocktoday) {
    this.dailystocktoday = dailystocktoday;
    }

    public String getDaily() {
    return daily;
    }

    public void setDaily(String daily) {
    this.daily = daily;
    }

    public String getSearch() {
    return search;
    }

    public void setSearch(String search) {
    this.search = search;
    }

    public String getStock() {

    return stock;
    }

    public void setStock(String stock) {
    this.stock = stock;
    }

    public List<String> getItemcodelst() {
    return itemcodelst;
    }

    public void setItemcodelst(List<String> itemcodelst) {
    this.itemcodelst = itemcodelst;
    }

    public List<Grn> getGrnHistory() {
    return grnHistory;
    }

    public void setGrnHistory(List<Grn> grnHistory) {
    this.grnHistory = grnHistory;
    }

    @RolesAllowed({PermissionConstants.ADD_REPORT,PermissionConstants.UPDATE_REPORT,PermissionConstants.DELETE_REPORT})
    @DefaultHandler
    public Resolution reportLink()
    {
    return new ForwardResolution(REPORT);
    }
    public Resolution getItemCodeLst()
    {
    itemcodelst=itemdao.getItemNamelst();

    return new JavaScriptResolution(itemcodelst);
    }
    @RolesAllowed({PermissionConstants.ADD_REPORT,PermissionConstants.UPDATE_REPORT,PermissionConstants.DELETE_REPORT})
    public Resolution byToday()
    {

    /*
    DaulAxisDemo4.daily("By today");
    */
    dailystocktoday=storeissuedao.getDailyStockDate();
    stock="byItem";
    search="byDaily";
    return new ForwardResolution(REPORT);
    }
    @RolesAllowed({PermissionConstants.ADD_REPORT,PermissionConstants.UPDATE_REPORT,PermissionConstants.DELETE_REPORT})
    public Resolution bySelectDate() {
    sdate=getSdate().replace("/","-");
    try{
    DateFormat  formatter = new SimpleDateFormat("yyyy-MM-dd");
    Date date = (Date)formatter.parse(sdate);
    sdate = formatter.format(date);
    }
    catch (ParseException e)
    {
    System.out.println("Exception :"+e);
    }
    dailystocktoday=storeissuedao.getDailyStockDate(sdate);
    return new ForwardResolution(REPORT);
    }


    @RolesAllowed({PermissionConstants.ADD_REPORT,PermissionConstants.UPDATE_REPORT,PermissionConstants.DELETE_REPORT})
    public Resolution byYear() {
    if(search.equals("byFromTo")){
    fromdate=getFromdate().replace("/","-");
    todate=getTodate().replace("/","-");
    try{
    DateFormat  formatter = new SimpleDateFormat("yyyy-MM-dd");
    Date fdate = (Date)formatter.parse(fromdate);
    Date tdate = (Date)formatter.parse(todate);
    fromdate = formatter.format(fdate);
    todate = formatter.format(tdate);
    }
    catch (ParseException e)
    {
    System.out.println("Exception :"+e);
    }
    dailystocktoday=storeissuedao.getDailyStockByFromTo(getItemcodetxt(),fromdate,todate);
    }
    else if(search.equals("byYearly")){
    dailystocktoday=storeissuedao.getDailyStockYear(getItemcodetxt(),getY());
    } else if(search.equals("byMonthly")){
    dailystocktoday=storeissuedao.getDailyStockMonth(getItemcodetxt(),getMonth(),getYear());
    } else if(search.equals("byDailyLedger")){
    List<DailyStockRecord> tempList=storeissuedao.getDailyStockByItemCode(getItemcodetxt(),getMonth(),getYear());

    dailyLedger=new ArrayList<DailyStockRecord>();
    Calendar cal=Calendar.getInstance();
    cal.set(getYear(),(getMonth()-1),1);

    DailyStockRecord dailyrecord=null;
    int days = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
    for(int i=1;i<=days;i++){

    for(Iterator<DailyStockRecord> r=tempList.iterator();r.hasNext();){
    dailyrecord=r.next();
    Integer grnDay=Integer.parseInt(dailyrecord.getDate().toString().substring(8,10));
    if(grnDay.equals(i)){
    dailyLedger.add(dailyrecord);

    if(tempList.size()!=1){
    r.remove();
    }
    break ;
    }
    else{
    DailyStockRecord temp=new DailyStockRecord();
    cal.set(getYear(),(getMonth()-1),i);
    temp.setDate(cal.getTime());
    temp.setItem(dailyrecord.getItem());
    if(tempList.size()!=1){
    temp.setOpenQuantity(dailyrecord.getOpenQuantity());
    temp.setClosingQuantity(dailyrecord.getOpenQuantity());
    }
    if(tempList.size()==1 && i<grnDay){
    temp.setOpenQuantity(dailyrecord.getOpenQuantity());
    temp.setClosingQuantity(dailyrecord.getOpenQuantity());
    }
    if(tempList.size()==1 && i>grnDay){
    temp.setOpenQuantity(dailyrecord.getClosingQuantity());
    temp.setClosingQuantity(dailyrecord.getClosingQuantity());
    }
    dailyLedger.add(temp);
    break ;
    }
    }
    }

    }
    return new ForwardResolution(REPORT);
    }

    public Resolution byMonthGrn(){
          if(stock.equals("bySection")){
    List<Grn> tempList=grndao.getGrnByMonth(getMonth(),getYear());
    grnHistory=new ArrayList<Grn>();
    Calendar cal=Calendar.getInstance();
    cal.set(getYear(),(getMonth()-1),1);
    Grn gr=null;
    int days = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
    for(int i=1;i<=days;i++){
    for(Iterator<Grn> r=tempList.iterator();r.hasNext();){
    gr=r.next();
    Integer grnDay=Integer.parseInt(gr.getCreateDate().toString().substring(8,10));
    if(grnDay.equals(i)){
    grnHistory.add(gr);
    if(tempList.size()!=1){
    r.remove();
    }
    break ;
    }
    else{
    Grn temp=new Grn();
    cal.set(getYear(),(getMonth()-1),i);
    temp.setCreateDate(cal.getTime());
    grnHistory.add(temp);
    break ;
    }
    }
    }
    search="grn";
          }
           if(stock.equals("byPo")){
    List<PurchaseOrder> tempList=purchaseorderdao.getPoByMonth(getMonth(),getYear());
    poHistory=new ArrayList<PurchaseOrder>();
    Calendar cal=Calendar.getInstance();
    cal.set(getYear(),(getMonth()-1),1);
    PurchaseOrder po=null;
    int days = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
    for(int i=1;i<=days;i++){
    for(Iterator<PurchaseOrder> r=tempList.iterator();r.hasNext();){
    po=r.next();
    Integer grnDay=Integer.parseInt(po.getCreateDate().toString().substring(8,10));
    if(grnDay.equals(i)){
    poHistory.add(po);
    if(tempList.size()!=1){
    r.remove();
    }
    break ;
    }
    else{
    PurchaseOrder temp=new PurchaseOrder();
    cal.set(getYear(),(getMonth()-1),i);
    temp.setCreateDate(cal.getTime());
    poHistory.add(temp);
    break ;
    }
    }
    }

    search="grn";
          }
        if(stock.equals("byRequisition")){
    List<Requisition> tempList=requisitiondao.getRequisitionByMonth(getMonth(),getYear());
    reqHistory=new ArrayList<Requisition>();
    Calendar cal=Calendar.getInstance();
    cal.set(getYear(),(getMonth()-1),1);
    Requisition gr=null;
    int days = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
    for(int i=1;i<=days;i++){
    for(Iterator<Requisition> r=tempList.iterator();r.hasNext();){
    gr=r.next();
    Integer grnDay=Integer.parseInt(gr.getRequisitionDate().toString().substring(8,10));
    if(grnDay.equals(i)){
    reqHistory.add(gr);
    if(tempList.size()!=1){
    r.remove();
    }
    break ;
    }
    else{
    Requisition temp=new Requisition();
    cal.set(getYear(),(getMonth()-1),i);
    temp.setRequisitionDate(cal.getTime());
    reqHistory.add(temp);
    break ;
    }
    }
    }
    search="grn";
          }
    return new ForwardResolution("jsp/ledger.jsp");
    }


           public Resolution ledgerLink(){
            return new ForwardResolution("jsp/ledger.jsp");
       }

         public Resolution byLedger() {
          if(stock.equals("byDailyLedger")){
    List<DailyStockRecord> tempList=storeissuedao.getDailyStockByItemCode(getItemcodetxt(),getMonth(),getYear());

    dailyLedger=new ArrayList<DailyStockRecord>();
    Calendar cal=Calendar.getInstance();
    cal.set(getYear(),(getMonth()-1),1);

    DailyStockRecord dailyrecord=null;
    int days = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
    for(int i=1;i<=days;i++){

    for(Iterator<DailyStockRecord> r=tempList.iterator();r.hasNext();){
    dailyrecord=r.next();
    Integer grnDay=Integer.parseInt(dailyrecord.getDate().toString().substring(8,10));
    if(grnDay.equals(i)){
    dailyLedger.add(dailyrecord);

    if(tempList.size()!=1){
    r.remove();
    }
    break ;
    }
    else{
    DailyStockRecord temp=new DailyStockRecord();
    cal.set(getYear(),(getMonth()-1),i);
    temp.setDate(cal.getTime());
    temp.setItem(dailyrecord.getItem());
    if(tempList.size()!=1){
    temp.setOpenQuantity(dailyrecord.getOpenQuantity());
    temp.setClosingQuantity(dailyrecord.getOpenQuantity());
    }
    if(tempList.size()==1 && i<grnDay){
    temp.setOpenQuantity(dailyrecord.getOpenQuantity());
    temp.setClosingQuantity(dailyrecord.getOpenQuantity());
    }
      if(tempList.size()==1 && i>grnDay){
    temp.setOpenQuantity(dailyrecord.getClosingQuantity());
    temp.setClosingQuantity(dailyrecord.getClosingQuantity());
    }
    dailyLedger.add(temp);
    break ;
    }
    }
    }

    }
   return new ForwardResolution("jsp/ledger.jsp");
    }
    }
