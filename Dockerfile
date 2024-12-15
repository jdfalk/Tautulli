FROM tautulli/tautulli

RUN /usr/local/bin/python -m ensurepip --default-pip 
RUN /usr/local/bin/python -m pip install --no-cache-dir --no-input requests openai pydantic

CMD [ "python", "Tautulli.py", "--datadir", "/config" ]
ENTRYPOINT [ "./start.sh" ]

EXPOSE 8181
HEALTHCHECK --start-period=90s CMD curl -ILfSs http://localhost:8181/status > /dev/null || curl -ILfkSs https://localhost:8181/status > /dev/null || exit 1