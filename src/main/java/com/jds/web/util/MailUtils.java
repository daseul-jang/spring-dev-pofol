package com.jds.web.util;

import java.io.UnsupportedEncodingException;

import javax.activation.DataSource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class MailUtils {

	private JavaMailSender mailSender;
	private MimeMessage message;
	private MimeMessageHelper msgHelper;

	public MailUtils(JavaMailSender mailSender) throws MessagingException {
		this.mailSender = mailSender;
		message = this.mailSender.createMimeMessage();
		msgHelper = new MimeMessageHelper(message, true, "UTF-8");
	}

	public void setSubject(String subject) throws MessagingException {
		msgHelper.setSubject(subject);
	}

	public void setText(String htmlContent) throws MessagingException {
		msgHelper.setText(htmlContent, true);
	}

	public void setFrom(String email, String name) throws UnsupportedEncodingException, MessagingException {
		msgHelper.setFrom(email, name);
	}

	public void setTo(String email) throws MessagingException {
		msgHelper.setTo(email);
	}

	public void addInline(String contentId, DataSource dataSource) throws MessagingException {
		msgHelper.addInline(contentId, dataSource);
	}

	public void send() {
		mailSender.send(message);
	}

}
