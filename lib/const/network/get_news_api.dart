import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_eg/business/news_cubit.dart';
import 'package:news_app_eg/modules/webview_screen/webview_screen.dart';

Widget buildArticleItem(Map articles,  context) => InkWell(
  onTap: (){
    navigateTo(context, WebViewScreenss(url: articles['url']));
  },
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Container(
          height: 120.0,
          width: 120.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: NetworkImage('${articles['urlToImage']}'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 120.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    '${articles['title']}',

                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '${articles['publishedAt']}',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  ),
);

Widget myDivider() =>const Divider(
      color: Colors.grey,
      height: 1.0,
      thickness: double.infinity,
    );

Widget articleBuilder(list,  context,{isSearch = false}){
  return  ListView.separated(
    physics: const BouncingScrollPhysics() ,
    itemBuilder: (index,context)=>buildArticleItem(list[index],context),
    separatorBuilder: (context , index) => myDivider(),
    itemCount: 20,
  );
}

Widget defaultFormField({
  required TextEditingController controller,
  required String labelText,
  required Function validate,
  required IconData prefixIcon,
  required Function onChange,
  IconData? suffixIcon,
  TextInputType? type,
}) => TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: Icon(suffixIcon),
        border: const OutlineInputBorder(),
      ),
      validator: (value) => validate(value),
  onChanged: (value) => onChange(value),
      keyboardType: type,
    );
void navigateTo(context, widget) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}