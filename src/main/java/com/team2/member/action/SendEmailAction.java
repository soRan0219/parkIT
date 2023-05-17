
package com.team2.member.action;

import java.util.Properties;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team2.commons.Action;
import com.team2.commons.ActionForward;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmailAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		System.out.println("SendEmailAction_execute()");
		
		// 인증번호 생성
		Random random = new Random();
		int verificationCode = 100000 + random.nextInt(900000); // 100000 이상 999999 이하의 숫자

		// 생성된 인증번호를 세션에 저장
		request.getSession().setAttribute("verificationCode", String.valueOf(verificationCode));
		System.out.println("인증번호 : " + verificationCode);
		
		// 이메일 전송 설정
		String host = "smtp.gmail.com";
		String port = "587";
		String username = "daehwi330@gmail.com";
		String password = "jgjqelkdrhfdjgtz";

		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.ssl.trust", host);

		// 이메일 메시지 작성
		String recipientEmail = request.getParameter("email");
		String subject = "이메일 인증 코드";
		String content = "인증 코드: " + verificationCode;

		Session session = Session.getInstance(props, new Authenticator() {
		    protected PasswordAuthentication getPasswordAuthentication() {
		        return new PasswordAuthentication(username, password);
		    }
		});

		try {
		    Message message = new MimeMessage(session);
		    message.setFrom(new InternetAddress(username));
		    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
		    message.setSubject(subject);
		    message.setText(content);

		    // 이메일 전송
		    Transport.send(message);
		    System.out.println("이메일 전송 완료");

		} catch (MessagingException e) {
		    e.printStackTrace();
		    System.out.println("이메일 전송 오류");
		}
		
		
		
		
		return null;
	}

	
	
}
