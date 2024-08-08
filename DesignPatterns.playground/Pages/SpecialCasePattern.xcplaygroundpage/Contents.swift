//MARK: Special Case Pattern


//MARK: 1 Create the main interface
protocol Notification {
    func send()
}

//MARK: 2 Main interface implementations
class EmailNotification: Notification {
    func send() {
        print("Sending email...")
    }
}

class SMSNotification: Notification {
    func send() {
        print("Sending SMS...")
    }
}

class PushNotification: Notification {
    func send() {
        print("Sending push notification...")
    }
}

//MARK: 3 Create Special Case
class EmailNotificationWithAttachment: EmailNotification {
    private let attachment: String
    
    init(attachment: String) {
        self.attachment = attachment
        super.init()
    }
    
    override func send() {
        super.send()
        print("Adding attachment: \(attachment)")
    }
}

//MARK: USAGE OF SPECIAL CASE PATTERN

func processNotification(_ notification: Notification) {
    notification.send()
}

let email = EmailNotification()
let sms = SMSNotification()
let push = PushNotification()
let emailWithAttachment = EmailNotificationWithAttachment(attachment: "file.pdf")

processNotification(email)
processNotification(sms)
processNotification(push)
processNotification(emailWithAttachment)

