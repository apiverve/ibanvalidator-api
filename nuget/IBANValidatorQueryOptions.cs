using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.IBANValidator
{
    /// <summary>
    /// Query options for the IBAN Validator API
    /// </summary>
    public class IBANValidatorQueryOptions
    {
        /// <summary>
        /// The IBAN to validate. Spaces, dashes and lower case are accepted
        /// </summary>
        [JsonProperty("iban")]
        public string Iban { get; set; }
    }
}
