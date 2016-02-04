
package org.hadoop.hive.vimox;
import org.apache.hadoop.hive.ql.exec.UDAF;
import org.apache.hadoop.hive.ql.exec.UDAFEvaluator;
import org.apache.hadoop.io.DoubleWritable;
@SuppressWarnings("deprecation")
public class Q4HiveAssingmentUDAF extends UDAF {

	
	public static class Q4HiveAssingmentUDAFEvaluator 
			implements UDAFEvaluator {

		private DoubleWritable result;
		
		@Override
		public void init() {
			result = new DoubleWritable(0);
		}
		
		public boolean iterate(int tsales, double commission_per) {
			
			result.set(result.get() + tsales*commission_per);
			return true;
		}
		
		public DoubleWritable terminatePartial() {
			return result;
		}
		
		public boolean merge(DoubleWritable otherValue) {
			if (otherValue == null) 
				return false;
			result.set(result.get() + otherValue.get());
			return true;
		}
		
		public DoubleWritable terminate() {
			return result;
		} 
		
	}
}
