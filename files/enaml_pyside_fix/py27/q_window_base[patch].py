        super(QWindowBase, self).__init__(parent, flags)
        self.initLayout()
    
    def initLayout(self):
        self._expl_min_size = QSize()
        self._expl_max_size = QSize()
        layout = QWindowLayout()
        layout.setSizeConstraint(QLayout.SetMinAndMaxSize)
        self.setLayout(layout)
        
    def layout(self):
        """ Get the layout of the window and initialize if not already.
        Returns
        -------
        result : QWidget or None
            The central widget of the window, or None if no widget
            was provided.
        """
        layout = super(QWindowBase, self).layout()
        if layout is None:
            self.initLayout()
            layout = super(QWindowBase, self).layout()
        return layout