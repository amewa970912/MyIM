package com.zhangyue.servlet;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.datatransfer.StringSelection;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zhangyue.utils.VerificationCode;


@WebServlet("/VerificationCode")
public class VerificationCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private VerificationCode vCode=new VerificationCode();
	
    public VerificationCodeServlet() {
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Font myFont = new Font("Arial Black", Font.BOLD, 18);
		int width = 100;
		int height = 30;
		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics g = image.getGraphics();	
		Color bgColor=new Color(200,250,200);
		g.setColor(bgColor);
		g.fillRect(1, 1, width-1, height-1);
		g.drawRect(1, 1, width-1, height-1);
		g.setFont(myFont);
		g.setColor(vCode.randomColor());
		String verificationvode=vCode.randomCode(); 
		int j=10,k=20,s=15;
		for(int i=0;i<verificationvode.length();i++)
		{
			g.setColor(vCode.randomColor());
			g.drawString(verificationvode.substring(i, i+1), k+s*i, 20);			
		}		
		g.dispose();
		ImageIO.write(image, "JPEG", response.getOutputStream());
		request.setAttribute("verificationvode", verificationvode);		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	@Override
	protected void service(HttpServletRequest arg0, HttpServletResponse arg1) throws ServletException, IOException {

		super.service(arg0, arg1);
	}

}
