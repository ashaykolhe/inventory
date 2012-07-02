package com.erp.utils;
import java.awt.Dimension;
import java.awt.Insets;
import java.io.File;
import java.io.FileWriter;
import java.io.BufferedWriter;
import java.io.PrintWriter;

import org.zefer.pd4ml.PD4Constants;
import org.zefer.pd4ml.PD4ML;
import org.zefer.pd4ml.PD4PageMark;

public class Converter {

	public static String convert(String content,String outputFileName) throws Exception {
		Converter converter = new Converter();
        File file=new File("c:\\temp.htm");
        PrintWriter pw=new PrintWriter(file);
        pw.write(content);
        pw.flush();
        pw.close();

		String htmlFileName = file.getAbsolutePath();
		File pdfFile = new File("c:\\"+outputFileName+".pdf");
		converter.generatePDF(htmlFileName, pdfFile, PD4Constants.A4,null,null);
        file.delete();
        return pdfFile.getAbsolutePath();
	}

	private void generatePDF(String inputHTMLFileName, File outputPDFFile, Dimension format, String fontsDir, String headerBody)
			throws Exception {

		java.io.FileOutputStream fos = new java.io.FileOutputStream(outputPDFFile);
		PD4ML pd4ml = new PD4ML();
		pd4ml.setPageInsets(new Insets(20, 10, 10, 10));
		pd4ml.setHtmlWidth(950);
		pd4ml.setPageSize(pd4ml.changePageOrientation(format)); // landscape page orientation
		if ( fontsDir != null && fontsDir.length() > 0 ) {
			pd4ml.useTTF( fontsDir, true );
		}
		if ( headerBody != null && headerBody.length() > 0 ) {
			PD4PageMark header = new PD4PageMark();
			header.setAreaHeight( -1 ); // autocompute
			header.setHtmlTemplate( headerBody ); // autocompute
			pd4ml.setPageHeader( header );
		}
		pd4ml.enableDebugInfo();
		pd4ml.render("file:" + inputHTMLFileName, fos);
	}
}
