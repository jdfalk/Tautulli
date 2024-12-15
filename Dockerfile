FROM tautulli/tautulli

# COPY requirements.txt requirements.txt

# RUN apt-get update && apt-get install -q -y --no-install-recommends python3-pydantic
# RUN /usr/local/bin/python -m ensurepip --default-pip 
# RUN \
#     pip install --no-cache-dir --upgrade pip && \
#     pip install --no-cache-dir --upgrade \
#     --extra-index-url https://www.piwheels.org/simple \
#     -r requirements.txt && \
#     rm requirements.txt && \
#     rm -rf /var/lib/apt/lists/*
RUN /usr/local/bin/python -m pip install --no-cache-dir requests openai


CMD [ "python", "Tautulli.py", "--datadir", "/config" ]
ENTRYPOINT [ "./start.sh" ]

EXPOSE 8181
HEALTHCHECK --start-period=90s CMD curl -ILfSs http://localhost:8181/status > /dev/null || curl -ILfkSs https://localhost:8181/status > /dev/null || exit 1