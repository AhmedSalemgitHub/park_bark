import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';


class ProductDetails extends StatefulWidget {
  final productDetailName;
  final productDetailPicture;
  final productDetailOldPrice;
  final productDetailPrice;

  ProductDetails(
      {this.productDetailName,
      this.productDetailPicture,
      this.productDetailOldPrice,
      this.productDetailPrice});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  double rating =1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.productDetailName),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 250,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.productDetailPicture),
              ),
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    widget.productDetailName,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  title: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text('${widget.productDetailOldPrice}',
                            style: TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            )),
                      ),
                      Expanded(
                        child: Text(
                          '${widget.productDetailPrice}',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Divider(),
          MaterialButton(
            onPressed: (){},
            color: Colors.blue,
            textColor: Colors.white,
            child: Text("Buy"),
          ),
          Divider(),
          Center(
            child: SmoothStarRating(
                allowHalfRating: false,
                onRatingChanged: (v) {
                  rating = v;
                  setState(() {});
                },
                starCount: 5,
                rating: rating,
                size: 40.0,
                filledIconData: Icons.star,
                halfFilledIconData: Icons.star_half,
                color: Colors.green,
                borderColor: Colors.green,
                spacing:0.0
            ),
          ),
          Divider(),
          ListTile(
            title: Text("Details"),
            subtitle: Text("djvhslfjhslfjhvglshgbdhh fghj fjm fjm fjmfjbfhjkg hjm gcmskfhv nsdf,hvg "
                "ankfdhgv sndkhv gsfhjm gk,gk, gk, ghkk, tolfjmff cbnm fhk,fjmfj,gndfklvg snkfjhg"
                " nskfdjhvg sghk,gjk,g,gl.gnmdlglfjmskfk;gk/g.fk,dlfu/h;glk,dj,fnkdfjhvg snkcjhv "
                " nskfdjhvg sghk,gjk,g,gl.gnmdlglfjmskfk;gk/g.fk,dlfu/h;glk,dj,fnkdfjhvg snkcjhv "
                " nskfdjhvg sghk,gjk,g,gl.gnmdlglfjmskfk;gk/g.fk,dlfu/h;glk,dj,fnkdfjhvg snkcjhv "
                " nskfdjhvg sghk,gjk,g,gl.gnmdlglfjmskfk;gk/g.fk,dlfu/h;glk,dj,fnkdfjhvg snkcjhv "
                " nskfdjhvg sghk,gjk,g,gl.gnmdlglfjmskfk;gk/g.fk,dlfu/h;glk,dj,fnkdfjhvg snkcjhv "
                "nskjfh vbkfhk,fhk,f fkllfj,fo;fj,fhk.gl/h;k/gnm dfk.fljfdgjmdjgkfhk;snkdfhv bsnk"
                "dhjb nskdhb nshjdhgkfj,gh,gj.kl/chmfhilhjmdgj,fhklgjkm,gjl.hkhv nskdhf gnskdh gn"),
          ),
        ],
      ),
    );
  }
}
