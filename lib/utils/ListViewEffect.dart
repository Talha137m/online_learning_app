import 'package:flutter/material.dart';
import 'package:classes_app/utils/ListBloc.dart';
import 'package:classes_app/utils/ItemEffect.dart';

class ListViewEffect extends StatefulWidget {
  final Duration duration;
  final List<Widget> children;
  final int animationType;

  ListViewEffect(
      {Key? key,
      required this.duration,
      required this.children,
      required this.animationType})
      : super(key: key);

  _ListViewEffect createState() => new _ListViewEffect();
}

class _ListViewEffect extends State<ListViewEffect> {
  late ListBloc _listBloc;

  initState() {
    _listBloc = new ListBloc();
    super.initState();
  }

  Widget build(BuildContext context) {
    _listBloc.startAnimation(widget.children.length, widget.duration);

    return new Scaffold(
        body: new Container(
            child: new Container(
                height: MediaQuery.of(context).size.height,
                child: new ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: widget.children.length,
                    itemBuilder: (context, position) {
                      return new ItemEffect(
                          child: widget.children[position],
                          duration: widget.duration,
                          animationType: widget.animationType,
                          position: position);
                    }))));
  }

  @override
  void dispose() {
    _listBloc.dispose();
    super.dispose();
  }
}
