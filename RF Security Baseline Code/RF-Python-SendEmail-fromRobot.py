import email
import smtplib
def send_message(From, To, Subject):
    msg = email.message_from_string('warning message')
    msg['From'] = From
    msg['To'] = To
    msg['Subject'] = Subject
    s = smtplib.SMTP("smtp.gmail.com", 587)
    s.ehlo()
    s.starttls()
    s.ehlo()
    s.login(msg['From'], 'asdf@1234')
    s.sendmail(msg['From'], msg['To'], msg.as_string())
    s.quit()
    Subject= ("Send Completed")
    return Subject