FROM jupyter/datascience-notebook:b418b67c225b

RUN conda install -c conda-forge jupyter_contrib_nbextensions
RUN mkdir -p $(jupyter --data-dir)/nbextensions
RUN cd $(jupyter --data-dir)/nbextensions
RUN git clone https://github.com/lambdalisue/jupyter-vim-binding /home/jovyan/.local/share/jupyter/nbextensions/vim_binding
RUN jupyter nbextension enable vim_binding/vim_binding

COPY requirements.txt /requirements.txt
COPY functions /functions

WORKDIR /notebooks

CMD ["jupyter-lab","--ip=0.0.0.0","--no-browser","--allow-root"]
