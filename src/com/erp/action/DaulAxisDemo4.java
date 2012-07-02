package com.erp.action;

import java.awt.Color;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.*;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.DatasetRenderingOrder;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.CategoryItemRenderer;
import org.jfree.chart.renderer.category.LineAndShapeRenderer;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.ui.ApplicationFrame;
import org.jfree.ui.RefineryUtilities;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;

public class DaulAxisDemo4 extends ApplicationFrame {
    public DaulAxisDemo4(final String title) {

        super(title);

        final CategoryDataset dataset1 = createDataset1();

        // create the chart...
        final JFreeChart chart = ChartFactory.createBarChart3D(
            "Daily Stock Record",  // chart title
            "Category",         // domain axis label
            "Value",            // range axis label
            dataset1,           // data
            PlotOrientation.VERTICAL,
            true,               // include legend
            true,
            false
        );


        chart.setBackgroundPaint(new Color(0xCC, 0xFF, 0xCC));

        // get a reference to the plot for further customisation...
        final CategoryPlot plot = chart.getCategoryPlot();
        plot.setDomainAxisLocation(AxisLocation.BOTTOM_OR_LEFT);
        plot.setRangeAxisLocation(AxisLocation.TOP_OR_LEFT);
        final CategoryItemRenderer renderer1 = plot.getRenderer();
        renderer1.setSeriesPaint(0, Color.red);
        plot.mapDatasetToRangeAxis(1, 1);
        final CategoryAxis domainAxis = plot.getDomainAxis();
        domainAxis.setCategoryLabelPositions(CategoryLabelPositions.DOWN_90);
        final CategoryItemRenderer renderer2 = new LineAndShapeRenderer();
        renderer2.setSeriesPaint(0, Color.blue);
        plot.setRenderer(1, renderer2);

        plot.setDatasetRenderingOrder(DatasetRenderingOrder.REVERSE);
        // OPTIONAL CUSTOMISATION COMPLETED.

        // add the chart to a panel...
        final ChartPanel chartPanel = new ChartPanel(chart);
        chartPanel.setPreferredSize(new java.awt.Dimension(600,480));
        setContentPane(chartPanel);

    }
    private CategoryDataset createDataset1() {

        // row keys...
        final String series1 = "First";
        final String series2 = "Second";
        final String series3 = "Third";



        // create the dataset...
        final DefaultCategoryDataset dataset = new DefaultCategoryDataset();


        String dbtime;
        String dbUrl = "jdbc:mysql://localhost/ventura_enterpride";
        String dbClass = "com.mysql.jdbc.Driver";
        String query = "Select * from daily_stock";

        try {

        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection (dbUrl,"root","admin");
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery(query);

        while (rs.next()) {
        dataset.addValue(rs.getDouble(2), series1, rs.getDate(3)+"Item Id :"+rs.getInt(8));
        } //end while

        con.close();
        } //end try

        catch(Exception e) {
        e.printStackTrace();
        }
        return dataset;

    }
    public static void  daily(String name)
    {
         final DaulAxisDemo4 demo = new DaulAxisDemo4(name);
           demo.pack();
           RefineryUtilities.centerFrameOnScreen(demo);
           demo.setVisible(true);
    }
    public static void main(final String[] args) {
         daily("daily stock record");
    }

}
