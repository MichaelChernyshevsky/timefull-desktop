import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timefull/manager/packages/note/bloc.dart';
import 'package:timefullcore/packages/note/models/model.dart';

class PageElement extends StatefulWidget {
  const PageElement({super.key, required this.page, this.contentPage});
  final PageWithNotes page;
  final ContentPage? contentPage;

  @override
  State<PageElement> createState() => _PageElementState();
}

class _PageElementState extends State<PageElement> {
  late NoteBloc _noteBloc;

  bool showAll = true;

  @override
  void initState() {
    super.initState();
    _noteBloc = BlocProvider.of<NoteBloc>(context);
  }

  void deletePade(int id) => _noteBloc.add(DeletePage(id: id));

  void addChildPage() => _noteBloc.add(CreatePage());
  void changeShowState() => setState(() => showAll = !showAll);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorWidget,
      child: Row(
        children: [
          Text(widget.page.page.title),
          const Spacer(),
          GestureDetector(
            onTap: () => deletePade(widget.page.page.id),
            child: const Icon(Icons.remove),
          ),
          if (showAll) _buildChildPage(widget.page.childPage)
        ],
      ),
    );
  }

  Color get colorWidget {
    if (widget.contentPage != null && widget.contentPage!.showAllPages == false) {
      if (widget.contentPage!.page!.page.id == widget.page.page.id) {
        return Colors.blue;
      }
    }
    return Colors.white;
  }

  Widget _buildChildPage(List<PageWithNotes> pages) {
    return const Column(
      children: [],
    );
  }
}
