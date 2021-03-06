import 'package:flutter/material.dart';
import 'package:networkbound/custom_progress_indicator.dart';
import 'package:networkbound/response.dart';
import 'package:networkbound/viewmodel/news_viewmodel.dart';
import 'package:provider/provider.dart';

import 'networking/resource.dart';
import 'service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await serviceLocator.allReady();
  runApp(NewsListScreen());

}

class NewsListScreen extends StatefulWidget {
  @override
  _NewsListScreenState createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  NewsViewModel viewModel = serviceLocator<NewsViewModel>();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<Resource<List<Response>>>(
      create: (context) => viewModel.getNewsList(),

      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('Flutter')),
          body: Consumer<Resource<List<Response>>>(
            builder: (context, viewModel, child) {
              if (viewModel != null) {
                print(viewModel.status);
                switch (viewModel.status) {
                  case Status.SUCCESS:
                    return NewsListWidget(viewModel.data);
                    break;
                  case Status.FAILED:
                    return Text(viewModel.error.toString());
                    break;
                  case Status.LOADING:
                    return NewsListWidget(viewModel.data);
                    break;
                  default:
                    {
                      return CustomProgressIndicator();
                    }
                }
              } else
                return CustomProgressIndicator();
            },
          ),
        ),
      ),

    );
  }
}

class NewsListWidget extends StatelessWidget {
  final List<Response> data;
  NewsListWidget(this.data);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: data == null ? 0 : data.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(data[index].title),
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }
}
