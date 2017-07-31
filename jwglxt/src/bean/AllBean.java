package bean;

import java.util.ArrayList;

public class AllBean {
	SelectBean sb = new SelectBean();
	ArrayList al = null;
	
	public ArrayList getLaoshi(){
		String sql = "select * from jiaoshi order by id desc";
		String args[] = {"id","name","pwd","jiaoshihao","zhenname","sex","shengri","yuanxiao","zhuanye","phone","address","email","shenfen"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getLaoshicha(String str){
		String sql = "select * from jiaoshi where zhenname like '%"+str+"%' order by id desc";
		String args[] = {"id","name","pwd","jiaoshihao","zhenname","sex","shengri","yuanxiao","zhuanye","phone","address","email","shenfen"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getLaoshi(String id){
		String sql = "select * from jiaoshi where id="+id;
		String args[] = {"id","name","pwd","jiaoshihao","zhenname","sex","shengri","yuanxiao","zhuanye","phone","address","email","shenfen"};
		al = sb.select(args, sql);
		return al;
	}
	
	public ArrayList getBanji(){
		String sql = "select * from banji order by id desc";
		String args[] = {"id","name","nianji","banzhuren","renshu","shuoming"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getBanjicha(String str){
		String sql = "select * from banji where name like '%"+str+"%' order by id desc";
		String args[] = {"id","name","nianji","banzhuren","renshu","shuoming"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getBanji(String id){
		String sql = "select * from banji where id="+id;
		String args[] = {"id","name","nianji","banzhuren","renshu","shuoming"};
		al = sb.select(args, sql);
		return al;
	}
	
	public ArrayList getXuesheng(){
		String sql = "select * from xuesheng order by id desc";
		String args[] = {"id","name","pwd","banji","xuehao","zhiwu","zhenname","sex","shengri","zuohao","shenfenzheng","minzu","jiguan","hukou","address","phone","email","beizhu","shenfen"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getXueshengcha(String str){
		String sql = "select * from xuesheng where zhenname like '%"+str+"%' order by id desc";
		String args[] = {"id","name","pwd","banji","xuehao","zhiwu","zhenname","sex","shengri","zuohao","shenfenzheng","minzu","jiguan","hukou","address","phone","email","beizhu","shenfen"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getXuesheng(String id){
		String sql = "select * from xuesheng where id="+id;
		String args[] = {"id","name","pwd","banji","xuehao","zhiwu","zhenname","sex","shengri","zuohao","shenfenzheng","minzu","jiguan","hukou","address","phone","email","beizhu","shenfen"};
		al = sb.select(args, sql);
		return al;
	}
	
	public ArrayList getKecheng(){
		String sql = "select * from kecheng order by id desc";
		String args[] = {"id","name","jiaoshi","keshi","beizhu"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getKechengcha(String str){
		String sql = "select * from kecheng where name like '%"+str+"%' order by id desc";
		String args[] = {"id","name","jiaoshi","keshi","beizhu"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getKecheng(String id){
		String sql = "select * from kecheng where id="+id;
		String args[] = {"id","name","jiaoshi","keshi","beizhu"};
		al = sb.select(args, sql);
		return al;
	}
	
	public ArrayList getKechengtable(int kecheng){
		String sql = "select * from kechengtable where kecheng="+kecheng+" order by id desc";
		String args[] = {"id","kecheng","didian","xingqi","shangxiawu","kejie","beizhu"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getKechengtable(String id){
		String sql = "select * from kechengtable where id="+id;
		String args[] = {"id","kecheng","didian","xingqi","shangxiawu","kejie","beizhu"};
		al = sb.select(args, sql);
		return al;
	}
	
	public ArrayList getChengji(){
		String sql = "select * from chengji order by id desc";
		String args[] = {"id","xuesheng","kemu","shijian","fenshu"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getChengjikemu(String str){
		String sql = "select * from chengji where kemu="+str+" order by id desc";
		String args[] = {"id","xuesheng","kemu","shijian","fenshu"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getChengjifenshu(String str){
		String sql = "select * from chengji where "+str+" order by id desc";
		String args[] = {"id","xuesheng","kemu","shijian","fenshu"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getChengjidan(String id){
		String sql = "select * from chengji where xuesheng='"+id+"' order by id desc";
		String args[] = {"id","xuesheng","kemu","shijian","fenshu"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getChengji(String id){
		String sql = "select * from chengji where id="+id;
		String args[] = {"id","xuesheng","kemu","shijian","fenshu"};
		al = sb.select(args, sql);
		return al;
	}
	
	public ArrayList getTaoke(){
		String sql = "select * from taoke order by id desc";
		String args[] = {"id","xuesheng","dates","yuanyin","pingyu"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getTaoke(String id){
		String sql = "select * from taoke where id="+id;
		String args[] = {"id","xuesheng","dates","yuanyin","pingyu"};
		al = sb.select(args, sql);
		return al;
	}
	
	public ArrayList getXuanke(String str,String id){
		String sql = "select * from kecheng where id not in (select kecheng from xuanke where xuesheng="+id+") "+str;
		String args[] = {"id","name","jiaoshi","keshi","beizhu"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getXuanke(String xuesheng){
		String sql = "select * from xuanke where xuesheng="+xuesheng+" order by id desc";
		String args[] = {"id","xuesheng","kecheng"};
		al = sb.select(sql, args);
		return al;
	}
}
