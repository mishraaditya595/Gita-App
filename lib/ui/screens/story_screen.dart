import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';


class StoryScreen extends StatefulWidget {
  String story;
  String title;

  StoryScreen({
    Key? key,
    required this.story,
    required this.title,
  }) : super(key: key);

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {

  final String sample = "\n<h3>AWS Cognito — Reasons Why I don't Use As An App Developer</h3>\n<figure><img alt=\"\" src=\"https://cdn-images-1.medium.com/max/1024/1*lyCsaroUWxpwlqBCodmQ1w.png\"></figure><p>Being an app developer, I need to take care of a lot of things while developing an app ranging from handling API requests to querying the database to maintaining reusable code to troubleshooting and fixing bugs. (Nah! not every bug is a feature.)</p>\n<p>But the first thing that I do, depending on the type of app, is to build a system to register and log users. There are a couple of ways of doing it — the traditional email — password method, signing with phone number and OTP and the most used social sign-in options. For the last couple of months, I am trying to make myself familiar with Amazon Web Services. And interestingly, I got to know that AWS offers a service that aims to simplify this login and register process and I was much interested at first glance.</p>\n<h3>What is AWS Cognito?</h3>\n<p>Amazon likes to describe Cognito as a service that lets you add user sign-up, sign-in, and access control to your web and mobile apps quickly and easily. It can scale to millions of users and support sign-in with social identity providers, such as Apple, Facebook, Google, and Amazon, and enterprise identity providers via SAML 2.0 and OpenID Connect.</p>\n<p>It supports multi-factor authentication and encryption of data-at-rest and in-transit. Amazon Cognito is HIPAA eligible and PCI DSS, SOC, ISO/IEC 27001, ISO/IEC 27017, ISO/IEC 27018, and ISO 9001 compliant. It also provides a built-in UI and easy configuration for federating identity providers, you can integrate Amazon Cognito to add user sign-in, sign-up, and access control to your app in minutes. Furthermore, the UI can be customized as per the developer’s tastes.</p>\n<h3>Why I Won’t Use Cognito?</h3>\n<p>No doubt, AWS Cognito sounds formidable on paper. It tells that it can take care of all the registration and signing hassles. It will also provide a built-in UI, further reducing the workload of designing the UI for the developers. But, when you try to use Cognito for some time, you will discover some rough edges around this shiny packaging.</p>\n<ul>\n<li>The first turn off that Cognito offers to a newbie developer is inadequate and rarely updated documentation. Whenever a developer tries to try a new service, library or framework in their applications, the first thing he/she does is to look for the documentation on how to use the same. And Cognito disappoints in this regard.</li>\n<li>Using Cognito for some time made me realise that it does support logins through native mobile apps. Coming from someone who has already used the Firebase Auth service, it is really unappealing. For instance, if a user wants to log in through his/her Facebook, incase of Firebase, the user will be asked to authorize log in from his/her Facebook app already present in his/her device but Cognito does this through an embedded web view that will direct them to the web version of Facebook and they have to enter their Facebook credentials again to authorize it. This process is often displeasing for the users.</li>\n<li>There is no documentation or a clear rule on how many times can a user enter a wrong password before getting blocked. There were instances where it blocked a user after attempting 5 wrong passwords while others were blocked after 7 attempts and some were at 8. This sounds very unprofessional.</li>\n<li>While we are talking about wrong password attempts, let me mention another issue that is related to wrong credentials. In case a user forgets his/her email, there is no service offered by Cognito for the user to recover it. The developers have to work on it themselves.</li>\n<li>Another issue with passwords: there is no service that prevents the user from setting up an already used password as the new password.</li>\n<li>There are no standards to migrate users from one user pool to another. The developers need to devise ways to do it manually.</li>\n</ul>\n<h3>Conclusion</h3>\n<p>AWS Cognito is definitely not for someone who is a newbie or is short on time or manpower or both. It does not really fit well with the needs of a mobile application and its developers. I may not be using it in the proper way but with all the resources I have and with my experience, I will recommend anyone who is willing to try out Cognito to tread with caution.</p>\n<p><strong>Let me know your thoughts in the comments.</strong></p>\n<blockquote>\n<strong><em>Disclaimer: </em></strong><em>This is a personal blog. Any views or opinions represented in this blog are personal and belong solely to the blog owner and do not represent those of people, institutions or organizations that the owner may or may not be associated with within a professional or personal capacity unless explicitly stated. Any views or opinions are not intended to malign any religion, ethnic group, club, organization, company, or individual. All content provided on this blog is for informational purposes only. The owner of this blog makes no representations as to the accuracy or completeness of any information on this site or found by following any link on this site. The owner will not be liable for any errors or omissions in this information nor for the availability of this information. The owner will not be liable for any losses, injuries, or damages from the display or use of this information.</em>\n</blockquote>\n<img src=\"https://medium.com/_/stat?event=post.clientViewed&amp;referrerSource=full_rss&amp;postId=df642ba07ab5\" width=\"1\" height=\"1\" alt=\"\"><hr>\n<p><a href=\"https://medium.com/aditya-mishra/aws-cognito-reasons-why-i-dont-use-as-an-app-developer-df642ba07ab5\">AWS Cognito — Reasons Why I don't Use As An App Developer</a> was originally published in <a href=\"https://medium.com/aditya-mishra\">Aditya Mishra</a> on Medium, where people are continuing the conversation by highlighting and responding to this story.</p>\n";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title, style: const TextStyle(overflow: TextOverflow.ellipsis), maxLines: 1,),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              icon: const Icon(Icons.arrow_back_ios_new))
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
            child: Html(
              data: widget.story,
            )),
      ),
    );
  }
}
