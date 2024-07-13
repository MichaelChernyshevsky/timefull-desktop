import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timefull/interface/screens/pages/note/page/page.dart';
import 'package:timefull/interface/screens/pages/note/page/page_element.dart';
import 'package:timefull/manager/packages/note/bloc.dart';
import 'package:timefull/manager/packages/note/childBloc/bloc.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  late NoteBloc _noteBloc;
  late PageBloc _pageBloc;

  @override
  void initState() {
    super.initState();
    _noteBloc = BlocProvider.of<NoteBloc>(context);
    _pageBloc = BlocProvider.of<PageBloc>(context);
  }

  void changeShowState() => _noteBloc.add(ChangeShowState());

  void addPage() => _noteBloc.add(CreatePage());

  void setPage(page) {
    _pageBloc.add(InitializeChild(page: page));
    _noteBloc.add(SetPage(page));
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return BlocBuilder<NoteBloc, NoteBlocState>(
      builder: (context, state) {
        return Row(
          children: [
            Container(
              padding: const EdgeInsets.only(right: 50),
              width: MediaQuery.of(context).size.width * (state.show ? 0.13 : 0.03),
              height: h,
              color: Colors.grey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(onTap: changeShowState, child: Container(width: 100, height: 10, color: Colors.green)),
                    Row(
                      children: [
                        const Text('Pages'),
                        GestureDetector(
                          onTap: addPage,
                          child: const Icon(Icons.add),
                        ),
                      ],
                    ),
                    Column(
                        children: state.pages.isNotEmpty
                            ? state.pages
                                .map(
                                  (page) => GestureDetector(onTap: () => setPage(page), child: PageElement(page: page, contentPage: state.contentPage)),
                                )
                                .toList()
                            : [const Text('empty')]),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 50),
              width: MediaQuery.of(context).size.width * (!state.show ? 0.90 : 0.80),
              height: h,
              color: Colors.white,
              child: state.pages.isEmpty
                  ? emptyPage
                  : state.contentPage.showAllPages
                      ? allPages
                      : const PageWidget(),
            ),
          ],
        );
      },
    );
  }

  Column get emptyPage => Column(
        children: [
          Center(
            child: Column(
              children: [
                const Text('You dont have pages yet'),
                GestureDetector(
                  onTap: addPage,
                  child: const Text('Create Page'),
                ),
              ],
            ),
          )
        ],
      );

  Column get allPages => const Column(children: [Text('all')]);
}
