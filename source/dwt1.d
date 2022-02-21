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
dub build --single source/dwt1.d (生成在source目录下，不运行)
dub build --build=release --single source/dwt1.d (生产模式build: 失败)
dub --single source/dwt1.d (运行)
*/

/* 

手工压缩: 
cd source && strip dwt1 -o dwt1.strip && upx -f dwt1.strip -o dwt1.upx && rm -rf dwt1.strip

清理: 
cd source && find . -type f -executable -delete
*/


/* 
示例: 
https://www.eclipse.org/swt/snippets/ (java)
https://github.com/d-widget-toolkit/dwt/blob/master/org.eclipse.swt.snippets/src/org/eclipse/swt/snippets (dlang)
https://www.vogella.com/tutorials/SWT/article.html
 */
import std.stdio;
import std.process;

import org.eclipse.swt.SWT;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Shell;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.widgets.Text;
import org.eclipse.swt.widgets.MessageBox;
import org.eclipse.swt.events.SelectionAdapter;
import org.eclipse.swt.events.SelectionEvent;
import org.eclipse.swt.layout.RowLayout;
import org.eclipse.swt.layout.RowData;

template TScope( T ) {
    private T sum(T a, T b) {
        return a + b;
    }
}

void exec_shell(){
    const result = executeShell("ls -l ./"); 
    const returnCode = result[0]; 
    const output = result[1]; 
    writefln("ls returned %s.", returnCode); 
    writefln("Its output:\n%s", output);    
}

void show_dialog(Shell shell){
    auto m1 = new MessageBox(shell);
    m1.open();
}

void test1_hello(){
    auto display = new Display;
    auto shell = new Shell;
    shell.setText("snippet 108");
    shell.setBounds(800,400,800,600);

    Text text = new Text(shell,SWT.BORDER);

    Label label = new Label(shell,SWT.NONE);
    label.setText("姓名：");

    Button button = new Button(shell,SWT.BORDER);
    button.setText("测试");
    button.addSelectionListener(new class SelectionAdapter{
        //捕获SelectionEvent, 必须显式写出override
        override
        public void widgetSelected(SelectionEvent e){ 
            // 获取输入
            auto content = text.getText();
            writefln("用户输入内容为: %s",content);

            // 调用函数
            auto a = 11;
            auto b = 22;
            auto result = TScope!int.sum(a, b);
            writefln("hello world: %d",result);

            // 执行外部处理
            writeln("准备执行shell命令: ");
            exec_shell();

            // 显示对话框
            writeln("================");
            writeln("准备打开对话框");
            show_dialog(shell);
        }
    });

    // 使用row布局
    shell.setLayout(new RowLayout);
    shell.open();
    while (!shell.isDisposed)
        if (!display.readAndDispatch())
            display.sleep();
    display.dispose();
}

void main(){
    test1_hello();
}