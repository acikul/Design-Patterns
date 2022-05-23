#include <iostream>
#include <assert.h>
#include <stdlib.h>

  struct Point{
    int x; int y;
  };
  struct Shape{
    enum EType {circle, square, rhomb};
    EType type_;
  };
  struct Circle{
     Shape::EType type_;
     double radius_;
     Point center_;
  };
  struct Square{
     Shape::EType type_;
     double side_;
     Point center_;
  };
  struct Rhomb{
    Shape::EType type_;
    double side_;
    Point center_;
  };

  void drawSquare(struct Square*){
    std::cerr <<"in drawSquare\n";
  }
  void drawCircle(struct Circle*){
    std::cerr <<"in drawCircle\n";
  }
  void drawRhomb(struct Rhomb*){
    std::cerr <<"in drawRhomb\n";
  }
  void drawShapes(Shape** shapes, int n){
    for (int i=0; i<n; ++i){
      struct Shape* s = shapes[i];
      switch (s->type_){
      case Shape::square:
        drawSquare((struct Square*)s);
        break;
      case Shape::circle:
        drawCircle((struct Circle*)s);
        break;
      case Shape::rhomb:
        drawRhomb((struct Rhomb*)s);
        break;
      default:
        assert(0); 
        exit(0);
      }
    }
  }

  void moveSquare(struct Square* s, int x_pomak, int y_pomak) {
    s->center_.x += x_pomak;
    s->center_.y += y_pomak;
    std::cerr << "nove koordinate centra kvadrata: x = " << s->center_.x << " y = " << s->center_.y << std::endl;
  }
  void moveCircle(struct Circle* s, int x_pomak, int y_pomak) {
    s->center_.x += x_pomak;
    s->center_.y += y_pomak;
    std::cerr << "nove koordinate centra kruga: x = " << s->center_.x << " y = " << s->center_.y << std::endl;
  }
  void moveRhomb(struct Rhomb* s, int x_pomak, int y_pomak) {
    s->center_.x += x_pomak;
    s->center_.y += y_pomak;
    std::cerr << "nove koordinate centra romba: x = " << s->center_.x << " y = " << s->center_.y << std::endl;
  }
  void moveShapes(Shape** shapes, int n, int x_pomak, int y_pomak) {
    for (int i=0; i<n; i++) {
      struct Shape* s = shapes[i];
      switch (s->type_) {
        case Shape::square:
          moveSquare((struct Square*)s, x_pomak, y_pomak);
          break;
        case Shape::circle:
          moveCircle((struct Circle*)s, x_pomak, y_pomak);
          break;
        case Shape::rhomb:
          moveRhomb((struct Rhomb*)s, x_pomak, y_pomak);
          break;
        default:
          assert(0);
          exit(0);
      }
    }
  }

  int main(){
    Shape* shapes[5];
    shapes[0]=(Shape*)new Circle;
    shapes[0]->type_=Shape::circle;
    (((struct Circle*)shapes[0]) ->center_).x = 3;
    (((struct Circle*)shapes[0]) ->center_).y = 3;

    shapes[1]=(Shape*)new Square;
    shapes[1]->type_=Shape::square;
    (((struct Square*)shapes[1]) ->center_).x = 3;
    (((struct Square*)shapes[1]) ->center_).y = 3;

    shapes[2]=(Shape*)new Square;
    shapes[2]->type_=Shape::square;
    (((struct Square*)shapes[2]) ->center_).x = 3;
    (((struct Square*)shapes[2]) ->center_).y = 3;

    shapes[3]=(Shape*)new Circle;
    shapes[3]->type_=Shape::circle;
    (((struct Circle*)shapes[3]) ->center_).x = 3;
    (((struct Circle*)shapes[3]) ->center_).y = 3;

    shapes[4]=(Shape*)new Rhomb;
    shapes[4]->type_=Shape::rhomb;
    (((struct Rhomb*)shapes[4]) ->center_).x = 3;
    (((struct Circle*)shapes[4]) ->center_).y = 3;

    drawShapes(shapes, 5);
    std::cerr << std::endl;
    moveShapes(shapes, 5, -1, 2);
  }
