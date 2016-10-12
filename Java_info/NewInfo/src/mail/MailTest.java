package mail;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * 发送邮件的测试程序
 * 
 * @author 
 * 
 */
public class MailTest {

    public static void sendmail(String mailAddress, String content) throws MessagingException {
        // 配置发送邮件的环境属性
        final Properties props = new Properties();
        /*
         * 可用的属性： mail.store.protocol / mail.transport.protocol / mail.host /
         * mail.user / mail.from
         */
        // 表示SMTP发送邮件，需要进行身份验证
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.host", "smtp.163.com");
        // 发件人的账号
        props.put("mail.user", "java_info@163.com");
        // 访问SMTP服务时需要提供的密码
        props.put("mail.password", "shit123");

        // 构建授权信息，用于进行SMTP进行身份验证
        Authenticator authenticator = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                // 用户名、密码
                String userName = props.getProperty("mail.user");
                String password = props.getProperty("mail.password");
                return new PasswordAuthentication(userName, password);
            }
        };
        // 使用环境属性和授权信息，创建邮件会话
        Session mailSession = Session.getInstance(props, authenticator);
        // 创建邮件消息
        MimeMessage message = new MimeMessage(mailSession);
        // 设置发件人
        InternetAddress form = new InternetAddress(
                props.getProperty("mail.user"));
        message.setFrom(form);

        // 设置收件人
        InternetAddress to = new InternetAddress(mailAddress);
        message.setRecipient(RecipientType.TO, to);


        // 设置邮件标题
        message.setSubject("尊敬的用户您好：");
        
        // 设置邮件的内容体
        message.setContent("请点击以下地址完成登陆验证 "+content+"  如不是本人操作请忽略此邮件", "text/html;charset=UTF-8");

        // 发送邮件
        Transport.send(message);
    }
}