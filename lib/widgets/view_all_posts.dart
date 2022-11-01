import 'package:flutter/material.dart';
import '/widgets/non_scrollable_grid.dart';

class ViewAllPosts extends StatefulWidget {
  const ViewAllPosts({super.key});

  @override
  State<ViewAllPosts> createState() => _ViewAllPostsState();
}

class _ViewAllPostsState extends State<ViewAllPosts> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }
  
  Widget _setTabView() {
    if (_tabController.index > 0) {
      return Container();
    }
    return NonScrollableGrid(
      itemPerRow: 3,
      gap: 3.0,
      children: List.generate(8, (index) {
        return Container(
          height: 110.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: index % 2 == 0 ?
                const AssetImage('assets/images/post7.jpg') :
                const AssetImage('assets/images/post8.jpg'),
              fit: BoxFit.cover
            )
          ),
        );
      })
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          indicatorColor: Colors.black,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          labelPadding: const EdgeInsets.symmetric(vertical: 5.0),
          tabs: const [
            Icon(Icons.grid_on, size: 28.0),
            Icon(Icons.video_library_outlined, size: 28.0),
            Icon(Icons.play_arrow_outlined, size: 38.0),
            Icon(Icons.assignment_ind_outlined, size: 38.0)
          ]
        ),
        _setTabView()
      ]
    );
  }
}