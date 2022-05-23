package cetvrti;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public interface IGenerateIntList {
	List<Integer> generateList();
}

class IntGeneratorIntervalInc implements IGenerateIntList {
	
	private int start;
	private int end;
	private int inc;

	public IntGeneratorIntervalInc(int start, int end, int inc) {
		this.start = start;
		this.end = end;
		this.inc = inc;
	}
	public List<Integer> generateList() {
		
		List<Integer> list = new ArrayList<>();
		for (int i=start; i <= end; i += inc) {
			list.add(i);
		}
		return list;
	}
	
}

class IntGeneratorNormDist implements IGenerateIntList {
	
	private int mean;
	private int stdDev;
	private int numElem;

	public IntGeneratorNormDist(int mean, int stdDev, int numElem) {
		this.mean = mean;
		this.stdDev = stdDev;
		this.numElem = numElem;
	}
	public List<Integer> generateList() {
		Random rand = new Random();
		List<Integer> list = new ArrayList<>();
		
		for (int i = 0; i < numElem; i++) {
			int generated = (int)Math.round(rand.nextGaussian())*stdDev+mean;
			list.add(generated);
		}
		return list;
	}
	
}

class IntGeneratorFibb implements IGenerateIntList {
	
	private int numElem;
	
	public IntGeneratorFibb(int numElem) {
		this.numElem = numElem;
	}

	public List<Integer> generateList() {
		
		List<Integer> list = new ArrayList<>();
		int prevPrev = 1;
		int prev = 1;
		list.add(prevPrev);
		list.add(prev);
		
		for (int i = 2; i < numElem; i++) {
			int current = prevPrev + prev;
			list.add(current);
			prevPrev = prev;
			prev = current;
		}

		return list;
	}
	
}