import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Info extends StatefulWidget
{

  @override
  State<StatefulWidget> createState() => InformationState();

}

class InformationState extends State< Info >
{

  var bgColors = Colors.black12;

  YoutubePlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'bPITHEiFWLc',
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text( 'Awareness' ),
        ),
        body: Container(
          child: ListView(
            children: <Widget>[

              Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: bgColors,
                      borderRadius: BorderRadius.circular( 10 )
                  ),
                  child: YoutubePlayer(controller: _controller,
                    
                  ),
              ),

              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: bgColors,
                    borderRadius: BorderRadius.circular( 10 )
                ),
                child: ExpansionTile(
                  title: Text( 'Symptoms' ),
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all( 10 ),
                      child: Text( 'Common signs of infection include respiratory symptoms, fever, cough, shortness of breath and breathing difficulties. In more severe cases, infection can cause pneumonia, severe acute respiratory syndrome, kidney failure and even death. ' ),
                    )
                  ],
                )
              ),

              Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: bgColors,
                      borderRadius: BorderRadius.circular( 10 )
                  ),
                  child: ExpansionTile(
                    title: Text( 'Basic Protective Measures' ),
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all( 10 ),
                        child: Text( '''Wash your hands frequently
Regularly and thoroughly clean your hands with an alcohol-based hand rub or wash them with soap and water.

Why? Washing your hands with soap and water or using alcohol-based hand rub kills viruses that may be on your hands.

Maintain social distancing
Maintain at least 1 metre (3 feet) distance between yourself and anyone who is coughing or sneezing.

Why? When someone coughs or sneezes they spray small liquid droplets from their nose or mouth which may contain virus. If you are too close, you can breathe in the droplets, including the COVID-19 virus if the person coughing has the disease.Avoid touching eyes, nose and mouth
Why? Hands touch many surfaces and can pick up viruses. Once contaminated, hands can transfer the virus to your eyes, nose or mouth. From there, the virus can enter your body and can make you sick.

Practice respiratory hygiene
Make sure you, and the people around you, follow good respiratory hygiene. This means covering your mouth and nose with your bent elbow or tissue when you cough or sneeze. Then dispose of the used tissue immediately.

Why? Droplets spread virus. By following good respiratory hygiene you protect the people around you from viruses such as cold, flu and COVID-19.If you have fever, cough and difficulty breathing, seek medical care early
Stay home if you feel unwell. If you have a fever, cough and difficulty breathing, seek medical attention and call in advance. Follow the directions of your local health authority.

Why? National and local authorities will have the most up to date information on the situation in your area. Calling in advance will allow your health care provider to quickly direct you to the right health facility. This will also protect you and help prevent spread of viruses and other infections.Stay informed and follow advice given by your healthcare provider
Stay informed on the latest developments about COVID-19. Follow advice given by your healthcare provider, your national and local public health authority or your employer on how to protect yourself and others from COVID-19.

Why? National and local authorities will have the most up to date information on whether COVID-19 is spreading in your area. They are best placed to advise on what people in your area should be doing to protect themselves.''' ),
                      ),
                    ],
                  )
              ),

              Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: bgColors,
                      borderRadius: BorderRadius.circular( 10 )
                  ),
                  child: ExpansionTile(
                    title: Text( 'Myth Busters' ),
                    children: <Widget>[
                      Container(
                        height: 200,
                        child: PhotoView(
                          imageProvider: NetworkImage( 'https://www.who.int/images/default-source/health-topics/coronavirus/myth-busters/52.tmb-1920v.png?sfvrsn=862374e_1' ),
                        )
                      ),
                      Container(
                          height: 200,
                          child: PhotoView(
                            imageProvider: NetworkImage( 'https://www.who.int/images/default-source/health-topics/coronavirus/myth-busters/web-mythbusters/mb-cold-snow.tmb-1920v.png?sfvrsn=1e557ba_1' ),
                          )
                      ),
                      Container(
                          height: 200,
                          child: PhotoView(
                            imageProvider: NetworkImage( 'https://www.who.int/images/default-source/health-topics/coronavirus/myth-busters/web-mythbusters/mb-hot-bath.tmb-1920v.png?sfvrsn=f1ebbc_1' ),
                          )
                      ),

                      Container(
                          height: 200,
                          child: PhotoView(
                            imageProvider: NetworkImage( 'https://www.who.int/images/default-source/health-topics/coronavirus/myth-busters/web-mythbusters/mb-mosquito-bite.tmb-1920v.png?sfvrsn=a1d90f6_1' ),
                          )
                      ),

                      Container(
                          height: 200,
                          child: PhotoView(
                            imageProvider: NetworkImage( 'https://www.who.int/images/default-source/health-topics/coronavirus/myth-busters/web-mythbusters/mythbusters-27.tmb-1920v.png?sfvrsn=d17bc6bb_1' ),
                          )
                      ),
                    ],
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}