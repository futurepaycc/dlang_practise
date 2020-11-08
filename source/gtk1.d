/+ dub.sdl:
    name "gtk1"
    dependency "gtk-d" version="~>3.9.0"
+/

/* 
debug编译：
dmd -I/home/liunix/.dub/packages/gtk-d-3.9.0/gtk-d/generated/gtkd /home/liunix/.dub/packages/gtk-d-3.9.0/gtk-d/libgtkd-3.a -L--no-as-needed -L-ldl -g  ./source/gtk1.d -of=.dub/build/gtk1
 */

import std.stdio;
import gtk.MainWindow;
import gtk.Main;
import gtk.Widget;
import gtk.Label;

void main(string[] args)
{
	Main.init(args);
	MainWindow window = new MainWindow("一个小标题2");
	window.addOnDestroy(delegate void(Widget w) { quitApp(); } );

	window.setDefaultSize(800,600);
	
	writeln("Hello GtkD Imperative");

	window.add(new Label("汉字呢"));

	// Show the window and its contents...
	window.showAll();
		
	// give control over to the gtkD .
	Main.run();
	
} // main()


private void quitApp()
{
	// This exists in case we want to do anything
	// before exiting such as warn the user to
	// save work.
	writeln("Bye.");
	Main.quit();
	
} // quitApp()