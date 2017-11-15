package com.zhangyue.utils;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.util.Random;

public class VerificationCode {
	
	public static void main(String[] args) {
		VerificationCode verificationCode = new VerificationCode();
		verificationCode.randomCode();
		verificationCode.randomColor();
	}

	Random random = new Random();

	public VerificationCode() {}
	
	public Color randomColor() {
		int r = random.nextInt(255);
		int g = random.nextInt(255);
		int b = random.nextInt(255);
		Color color = new Color(r, g, b);
		return color;
	}

	public String randomCode() {
		String str = "aAbcdefghiEFGHjklmYZ123456789nMNOPoVWpqrstuvwxyzBCDIJKLQRSTUX0";
		StringBuffer codeString = new StringBuffer();
		for(int i=0;i<4;i++)
		{
			codeString.append(str.charAt(random.nextInt(str.length()-1)));
		}
		return codeString.toString();
	}

}
