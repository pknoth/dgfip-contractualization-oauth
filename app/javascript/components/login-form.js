import React from 'react'
import Section from '../components/section'
import OAuth from '../lib/OAuth'

const oauth = new OAuth()

const LoginForm = () => (
  <Section>
    <h2 className="section__title">Connexion</h2>
    <p className="section__subtitle">
      <a href="{ oauth.authorizeUrl }">Se connecter auprès de notre fournisseur d'identité</a>
    </p>
  </Section>
)

export default LoginForm
