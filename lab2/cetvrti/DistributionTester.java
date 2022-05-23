package cetvrti;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


public class DistributionTester {
	public static IGenerateIntList intListGenerator;
	public static IPercentileCalc percentileCalc;

	public static void main(String[] args) {
		intListGenerator = new IntGeneratorIntervalInc(2, 30, 4);
		List<Integer> list1 = intListGenerator.generateList();
		System.out.println(list1);
		
		intListGenerator = new IntGeneratorNormDist(10, 2, 20);
		List<Integer> list2 = intListGenerator.generateList();
		System.out.println(list2);
		
		intListGenerator = new IntGeneratorFibb(10);
		List<Integer> list3 = intListGenerator.generateList();
		System.out.println(list3);
		
		List<Integer> wikiList = new ArrayList<>();
		wikiList.addAll(Arrays.asList(15,20,35,40,50));
		
		System.out.println("\nFibb closest rank:");
		percentileCalc = new NearestRankPercentileCalc(list3);
		percentileCalc.percentiles();
		
		System.out.println("\nFibb interpolation:");
		percentileCalc = new InterpolationRankPercentileCalc(list3);
		percentileCalc.percentiles();
	}

}
