class ControllWindow extends JFrame implements ActionListener{
  JButton startButton, stopButton;
  JTextField textField;
  JPanel panel;
  
  sketch_15_home21 parentWindow;
  
  ControllWindow(sketch_15_home21 parentWindow){
    super("Control Window");
    this.parentWindow = parentWindow;
    this.setSize(320, 240);
    
    panel = new JPanel();
    panel.setLayout(new BorderLayout());
    
    startButton = new JButton("start");
    startButton.setActionCommand("startButton_Pushed");
    startButton.addActionListener(this);
    panel.add(startButton, BorderLayout.PAGE_START);
    stopButton = new JButton("top");
    stopButton.setActionCommand("stopButton_Pushed");
    stopButton.addActionListener(this);
    panel.add(stopButton, BorderLayout.PAGE_END);
    textField = new JTextField("Controll Panel Text Field");
    panel.add(textField, BorderLayout.CENTER);
  
   this.getContentPane().add(panel);
   this.setVisible(true);
  
  }


  @Override
  void actionPerformed(ActionEvent e){
   String actionCommand = e.getActionCommand();
   textField.setText(actionCommand);
   parentWindow.eventsCalledFromControllWindow(actionCommand); 
  }
}