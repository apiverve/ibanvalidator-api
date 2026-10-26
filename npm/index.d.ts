declare module '@apiverve/ibanvalidator' {
  export interface ibanvalidatorOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface ibanvalidatorResponse {
    status: string;
    error: string | null;
    data: IBANValidatorData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface IBANValidatorData {
      iban:                null | string;
      isValid:             boolean | null;
      formatted:           null | string;
      countryCode:         null | string;
      countryName:         null | string;
      checkDigits:         null | string;
      expectedLength:      number | null;
      length:              number | null;
      errors:              any[];
      bban:                null | string;
      bankCode:            null | string;
      branchCode:          null | string;
      accountNumber:       null | string;
      nationalCheckDigits: null;
      expectedCheckDigits: null | string;
      isSEPA:              boolean | null;
      isQRIBAN:            boolean | null;
      checks:              Checks;
  }
  
  interface Checks {
      country:             boolean | null;
      length:              boolean | null;
      format:              boolean | null;
      checksum:            boolean | null;
      nationalCheckDigits: null;
  }

  export default class ibanvalidatorWrapper {
    constructor(options: ibanvalidatorOptions);

    execute(callback: (error: any, data: ibanvalidatorResponse | null) => void): Promise<ibanvalidatorResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: ibanvalidatorResponse | null) => void): Promise<ibanvalidatorResponse>;
    execute(query?: Record<string, any>): Promise<ibanvalidatorResponse>;
  }
}
