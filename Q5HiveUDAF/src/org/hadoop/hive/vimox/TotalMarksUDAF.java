package	org.hadoop.hive.vimox;


import org.apache.hadoop.hive.ql.exec.UDAF;
import org.apache.hadoop.hive.ql.exec.UDAFEvaluator;
import org.apache.hadoop.io.IntWritable;

@SuppressWarnings("deprecation")
public class TotalMarksUDAF extends UDAF {

	
	public static class TotalMarksUDAFEvaluator 
			implements UDAFEvaluator {

		private IntWritable result;
		
		@Override
		public void init() {
			// TODO Auto-generated method stub
			result = null;
		}
		
		public boolean iterate(IntWritable value) {
			
			if (value == null) {
				return false;
			}
			if (result == null) {
				result=new IntWritable(value.get());
			} else {
				result.set(result.get()+value.get());
			}
			return true;
		}
		
		public IntWritable terminatePartial() {
			return result;
		}
		
		public boolean merge(IntWritable other) {
			return iterate(other);
		}
		
		public IntWritable terminate() {
			return result;
		}
		
	}
}
