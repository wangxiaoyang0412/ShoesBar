package service;

import java.awt.Font;
import java.util.HashMap;
import java.util.Map;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.StandardChartTheme;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;

import util.Factory;

public class JChartImpl implements Jchart{

	@Override
	public JFreeChart test() throws Exception {
		// TODO Auto-generated method stub
		DefaultCategoryDataset dataset = new DefaultCategoryDataset();
		dataset.addValue(100, "北京", "苹果");
		dataset.addValue(100, "上海", "苹果");
		dataset.addValue(100, "广州", "苹果");
		dataset.addValue(200, "北京", "梨子");
		dataset.addValue(200, "上海", "梨子");
		dataset.addValue(200, "广州", "梨子");
		dataset.addValue(300, "北京", "葡萄");
		dataset.addValue(300, "上海", "葡萄");
		dataset.addValue(300, "广州", "葡萄");
		dataset.addValue(400, "北京", "香蕉");
		dataset.addValue(400, "上海", "香蕉");
		dataset.addValue(400, "广州", "香蕉");
		dataset.addValue(500, "北京", "荔枝");
		dataset.addValue(500, "上海", "荔枝");
		dataset.addValue(500, "广州", "荔枝");
		//创建主题样式
		StandardChartTheme standardChartTheme=new StandardChartTheme("CN");
		//设置标题字体
		standardChartTheme.setExtraLargeFont(new Font("黑体",Font.BOLD,20));
		//设置图例的字体
		standardChartTheme.setRegularFont(new Font("黑体",Font.BOLD,15));
		//设置轴向的字体
		standardChartTheme.setLargeFont(new Font("黑体",Font.BOLD,15));
		//应用主题样式
		ChartFactory.setChartTheme(standardChartTheme);
		JFreeChart chart = ChartFactory.createBarChart3D(
		        "水果", // 图表标题
		          "水果种类", // 目录轴的显示标签
		          "数量", // 数值轴的显示标签
		          dataset, // 数据集
		          PlotOrientation.VERTICAL, // 图表方向：水平、垂直
		          true,           // 是否显示图例(对于简单的柱状图必须是false)
		          false,          // 是否生成工具
		          false           // 是否生成URL链接
		          );
		
		return chart;
	}

	@Override
	public JFreeChart orderPricr_ByColor() throws Exception {
		// TODO Auto-generated method stub
		DefaultCategoryDataset dataset = new DefaultCategoryDataset();
		HashMap<String ,Float> brandMap = Factory.getIEmpDAOInstance().system_todayColorMoney();
		for (Map.Entry<String, Float> entry : brandMap.entrySet()) {
			 
		   // System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue());
		    dataset.addValue(entry.getValue(), "amount", entry.getKey());
		}

		//创建主题样式
		StandardChartTheme standardChartTheme=new StandardChartTheme("EN");
		ChartFactory.setChartTheme(standardChartTheme);
		JFreeChart chart = ChartFactory.createBarChart3D(
		        "Order By Color", // 图表标题
		          "color", // 目录轴的显示标签
		          "totalprice", // 数值轴的显示标签
		          dataset, // 数据集
		          PlotOrientation.VERTICAL, // 图表方向：水平、垂直
		          false,           // 是否显示图例(对于简单的柱状图必须是false)
		          false,          // 是否生成工具
		          false           // 是否生成URL链接
		          );
		
		return chart;
	}

	@Override
	public JFreeChart orderPrice_ByBrand() throws Exception {
		// TODO Auto-generated method stub
		DefaultCategoryDataset dataset = new DefaultCategoryDataset();
		HashMap<String ,Float> brandMap = Factory.getIEmpDAOInstance().system_todayBrandMoney();
		for (Map.Entry<String, Float> entry : brandMap.entrySet()) {
			 
		   // System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue());
		    dataset.addValue(entry.getValue(), "amount", entry.getKey());
		}
		//创建主题样式
		StandardChartTheme standardChartTheme=new StandardChartTheme("EN");
		ChartFactory.setChartTheme(standardChartTheme);
		JFreeChart chart = ChartFactory.createBarChart3D(
		        "Order By Brand", // 图表标题
		          "brand", // 目录轴的显示标签
		          "totalprice", // 数值轴的显示标签
		          dataset, // 数据集
		          PlotOrientation.VERTICAL, // 图表方向：水平、垂直
		          false,           // 是否显示图例(对于简单的柱状图必须是false)
		          false,          // 是否生成工具
		          false           // 是否生成URL链接
		          );
		
		return chart;
	}

}
