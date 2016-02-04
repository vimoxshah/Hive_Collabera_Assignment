import org.apache.hadoop.hive.ql.exec.UDF;

public class CommissionCalc extends UDF {
	
	public double evaluate(double sales, double commission_per) {
		
		return ((sales * commission_per)/100);
	}
}
