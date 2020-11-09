/+
dub.sdl:
    name "dwt1"
    dependency "dwt" version="1.0.5+swt-3.4.1"
    libs \
      "atk-1.0" \
      "cairo" \
      "dl" \
      "fontconfig" \
      "gdk-x11-2.0" \
      "gdk_pixbuf-2.0" \
      "glib-2.0" \
      "gmodule-2.0" \
      "gobject-2.0" \
      "gthread-2.0" \
      "gtk-x11-2.0" \
      "pango-1.0" \
      "pangocairo-1.0" \
      "X11" \
      "Xcomposite" \
      "Xcursor" \
      "Xdamage" \
      "Xext" \
      "Xfixes" \
      "Xi" \
      "Xinerama" \
      "Xrandr" \
      "Xrender" \
      "Xtst" \
      platform="linux"
+/

/* 
示例: 
https://www.eclipse.org/swt/snippets/ (java)
https://github.com/d-widget-toolkit/dwt/blob/master/org.eclipse.swt.snippets/src/org/eclipse/swt/snippets (dlang)
https://www.vogella.com/tutorials/SWT/article.html
 */
import std.stdio;
import org.eclipse.swt.SWT;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Shell;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.events.SelectionAdapter;
import org.eclipse.swt.events.SelectionEvent;
import org.eclipse.swt.layout.RowLayout;
import org.eclipse.swt.layout.RowData;
void main()
{
    auto display = new Display;
    auto shell = new Shell;
    shell.setText("snippet 108");
    shell.setBounds(800,400,800,600);

    Label label = new Label(shell,SWT.NONE);
    label.setText("姓名：");
    Button button = new Button(shell,SWT.BORDER);
    button.setText("测试");
    button.addSelectionListener(new class SelectionAdapter{
        override
        public void widgetSelected(SelectionEvent e){
            writeln("hello world");
        }
    });


    shell.setLayout(new RowLayout);
    // shell.pack();
    shell.open();

    while (!shell.isDisposed)
        if (!display.readAndDispatch())
            display.sleep();

    display.dispose();
}
