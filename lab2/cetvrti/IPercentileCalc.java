package cetvrti;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public interface IPercentileCalc {
		void percentiles();
}

class NearestRankPercentileCalc implements IPercentileCalc {
	
	private List<Integer> zadaniNiz;
	
	public NearestRankPercentileCalc( List<Integer> list) {
		this.zadaniNiz = list;
	}

	public void percentiles() {
		Collections.sort(zadaniNiz);
		int N = zadaniNiz.size();
		
		for (Double p = 10.0; p <= 90; p +=10) {
			Double ordinalRank = p/100 * N;
			Double temp = Math.ceil(ordinalRank);
			int n = temp.intValue();
			System.out.println(p.intValue() + ". percentil: " + zadaniNiz.get(n-1));
		}
		return;
	}
}

class InterpolationRankPercentileCalc implements IPercentileCalc {

	private List<Integer> zadaniNiz;
	
	public InterpolationRankPercentileCalc( List<Integer> list) {
		this.zadaniNiz = list;
	}

	public void percentiles() {
		Collections.sort(zadaniNiz);
		int N = zadaniNiz.size();
		
		List<Double> percentRankList = new ArrayList<>();
		for (int i = 1; i <= N; i++) {
			percentRankList.add(100.0/N*(i-0.5));
		}
		
		for (Double p = 10.0; p <= 90; p +=10) {
			if (p < percentRankList.get(0)) {
				System.out.println(p + ". percentil: " + zadaniNiz.get(0));
				continue;
			}
			if (p > percentRankList.get(N-1)) {
				System.out.println(p + ". percentil: " + zadaniNiz.get(N-1));
				continue;
			}
			
			double pVi, pVi_1,percCalc = 0;
	        for(int i=0; i<N-1; i++) {
	            pVi = percentRankList.get(i);
	            pVi_1 = percentRankList.get(i+1);
	            
	            if(p >= pVi && p <= pVi_1) {
	            	percCalc =(zadaniNiz.get(i) + N * (p - pVi) * (zadaniNiz.get(i+1) - zadaniNiz.get(i))/100.0);
	            	System.out.println(p.intValue() + ". percentil: " + percCalc);
	            	break;
	            }	            
	        }
		}
		return;
	}
}