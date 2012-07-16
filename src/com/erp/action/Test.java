package com.erp.action;
import org.jfree.chart.*;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.CategoryLabelPositions;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.LineAndShapeRenderer;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;
import java.awt.BasicStroke;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.swing.*;

public class Test extends JApplet {
	public void init()
	{
	
		 setSize(800,600);

		 try {
		        javax.swing.SwingUtilities.invokeAndWait(new Runnable() {
		            public void run() {
		            	 setContentPane(createContent());
		            }
		        });
		    } catch (Exception e) {
		        System.err.println("createGUI didn't successfully complete");
		    }
	}
/*	public Test()
	{
	setSize(800, 600);
		setContentPane(createContent());
	}
*/	private ChartPanel createContent() {
	
		final CategoryDataset dataset = createDataset();
        final JFreeChart chart = createChart(dataset);
        final ChartPanel chartPanel = new ChartPanel(chart);
        chartPanel.setPreferredSize(new Dimension(600,480));
/*		JPanel content = new JPanel(new BorderLayout());
		JTabbedPane tabbedPane = new JTabbedPane();
	
		tabbedPane.addTab("Line Chart", chartPanel);
*/		/*content.add(tabbedPane);*/
		return chartPanel;
		} 
	
	  private CategoryDataset createDataset() {
		  	
          // row keys...
          final String series1 = "Closing Qty";
          final String series2 = "Issued Qty";
          final String series3 = "Received Qty";

          // column keys...
          final DefaultCategoryDataset dataset = new DefaultCategoryDataset();

          String dbUrl = "jdbc:mysql://localhost/ventura_enterpride";
          String query = "Select * from daily_stock";

          try {
          Class.forName("com.mysql.jdbc.Driver");
          Connection con = DriverManager.getConnection (dbUrl,"root","admin");
          Statement stmt = con.createStatement();
          ResultSet rs = stmt.executeQuery(query);

          while (rs.next()) {
              dataset.addValue(rs.getDouble(2), series1, rs.getDate(3)+"Item Id :"+rs.getInt(8));
              dataset.addValue(rs.getDouble(4), series2,rs.getDate(3)+"Item Id :"+rs.getInt(8));
              dataset.addValue(rs.getDouble(6), series3,rs.getDate(3)+"Item Id :"+rs.getInt(8));
          } //end while

          con.close();
          } //end try

          catch(Exception e) {
          e.printStackTrace();
          }
          return dataset;
      }
      private JFreeChart createChart(final CategoryDataset dataset) {
          final JFreeChart chart = ChartFactory.createLineChart(
              "Daily Stock Report",       // chart title
              "Type",                    // domain axis label
              "Value",                   // range axis label
              dataset,                   // data
              PlotOrientation.VERTICAL,  // orientation
              true,                      // include legend
              true,                      // tooltips
              false                      // urls
          );
          chart.setBackgroundPaint(Color.white);
          final CategoryPlot plot = (CategoryPlot) chart.getPlot();
          plot.setBackgroundPaint(Color.lightGray);
          plot.setRangeGridlinePaint(Color.white);
            final CategoryAxis domainAxis = plot.getDomainAxis();
      domainAxis.setCategoryLabelPositions(CategoryLabelPositions.DOWN_90);
          // customise the range axis...
          final NumberAxis rangeAxis = (NumberAxis) plot.getRangeAxis();
          rangeAxis.setStandardTickUnits(NumberAxis.createIntegerTickUnits());
          rangeAxis.setAutoRangeIncludesZero(true);
          final LineAndShapeRenderer renderer = (LineAndShapeRenderer) plot.getRenderer();
          renderer.setSeriesStroke(
              0, new BasicStroke(
                  2.0f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND,
                  1.0f, new float[] {10.0f, 6.0f}, 0.0f
              )
          );
          renderer.setSeriesStroke(
              1, new BasicStroke(
                  2.0f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND,
                  1.0f, new float[] {6.0f, 6.0f}, 0.0f
              )
          );
          renderer.setSeriesStroke(
              2, new BasicStroke(
                  2.0f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND,
                  1.0f, new float[] {2.0f, 6.0f}, 0.0f
              )
          );
          return chart;
      }
}