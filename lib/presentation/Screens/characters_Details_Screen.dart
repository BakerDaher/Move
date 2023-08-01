// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move/business_logic/cubit/quato_cubit.dart';
import 'package:move/constant/my_Colors.dart';
import 'package:move/data/models/Characters.dart';
import 'package:flutter/scheduler.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class CharactersDetailsScreen extends StatefulWidget {
  final Characters1 character;
  const CharactersDetailsScreen({Key? key, required this.character})
      : super(key: key);

  @override
  State<CharactersDetailsScreen> createState() =>
      _CharactersDetailsScreenState();
}

class _CharactersDetailsScreenState extends State<CharactersDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<QuatoCubit>(context).getRandomeQuote();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    BlocProvider.of<QuatoCubit>(context).dispose();
    super.dispose() ;
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Scaffold(
      backgroundColor: MyColors.Grey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          //! body in Screen
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    characterInfo("Status : ", widget.character.status),
                    buildDivider(315),
                    characterInfo("Species : ", widget.character.species),
                    buildDivider(250),
                    characterInfo("Gender : ", widget.character.gender),
                    buildDivider(280),
                    characterInfo("Origin : ", widget.character.origin!.name),
                    buildDivider(300),
                    characterInfo(
                        "Location : ", widget.character.location!.name),
                    buildDivider(150),
                    characterInfo("Created : ", widget.character.created),
                    buildDivider(200),
                    SizedBox(
                      height: 16,
                    ),
                    BlocBuilder<QuatoCubit, QuatoState>(
                      builder: (context, state) {
                        if (state is QuatoGetAdvice) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: double.infinity ,
                              child: DefaultTextStyle(
                                style: TextStyle(
                                  fontSize: 20 ,
                                  color: MyColors.yellow ,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 7.0,
                                      color: MyColors.syrite ,
                                      offset: const Offset(0, 0),
                                    ),
                                  ],
                                ),
                                child: AnimatedTextKit(
                                  repeatForever: true,
                                  animatedTexts: [
                                    FlickerAnimatedText("${state.advice}"),
                                  ],
                                ),
                              ),
                            ),
                          ) ;
                        } else {
                          return Text("");
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 500,
              ),
            ]),
          ),
        ],
      ),
    );
  }

  //! AppBar
  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.Grey,
      flexibleSpace: FlexibleSpaceBar(
        //! Start tile in Title
        centerTitle: true,
        title: Text(
          widget.character.name,
          style: TextStyle(
            color: MyColors.syrite,
          ),
          textAlign: TextAlign.start,
        ),
        background: Hero(
          tag: widget.character.id,
          child: Image.network(
            widget.character.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
      leading: IconButton(
        onPressed: (){
          // Wrap Navigator with SchedulerBinding to wait for rendering state before navigating
          SchedulerBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pop() ;
          });
        },
        icon: Icon(Icons.arrow_back , color: MyColors.syrite , size: 24 ,),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(children: [
        TextSpan(
          text: title,
          style: TextStyle(
            color: MyColors.syrite,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        TextSpan(
          text: value,
          style: TextStyle(
            color: MyColors.syrite,
            fontSize: 16,
          ),
        ),
      ]),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      height: 30,
      endIndent: endIndent,
      color: MyColors.yellow,
      thickness: 2,
    );
  }
}